import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nail_makeup/app/app_config.dart';
import 'package:nail_makeup/model/api_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String PATCH = 'PATCH';
  static const String PUT = 'PUT';

  static const CONTENT_TYPE = 'Content-Type';
  static const CONTENT_TYPE_JSON = 'application/json; charset=utf-8';

  static final BaseOptions defaultOptions = BaseOptions(
      baseUrl: AppConfig.instance.baseApi,
      connectTimeout: 15000,
      receiveTimeout: 10000,
      responseType: ResponseType.json);

  late Dio _dio;

  static final Map<BaseOptions, ApiClient> _instanceMap = {};

  factory ApiClient({BaseOptions? options}) {
    if (options == null) options = defaultOptions;
    if (_instanceMap.containsKey(options)) {
      return _instanceMap[options]!;
    }
    final ApiClient apiClient = ApiClient._create(options: options);
    _instanceMap[options] = apiClient;
    return apiClient;
  }

  _requestHeader() async {
    String? token = 'await AppDataCenter.getToken()';

    Map<String, dynamic> headerMap =
        token != null ? {'Authorization': token} : Map();
    headerMap.putIfAbsent('accept', () => '*/*');

    return headerMap;
  }

  ApiClient._create({BaseOptions? options}) {
    if (options == null) options = defaultOptions;
    _dio = Dio(options);
    if (AppConfig.instance.log) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 180));
    }
  }

  static ApiClient get instance => ApiClient();

  Future<ApiResponse> request(
      {String? url,
      String? endpointKey,
      String method = POST,
      String? data,
      Map<String, dynamic>? formData,
      Map<String, dynamic>? queryParameters,
      bool getFullResponse = false}) async {
    Map<String, dynamic> headerMap = await _requestHeader();
    // Map<String, dynamic> headerMap = {};
    Response response;
    try {
      response = await _dio.request(url!,
          data: formData != null
              ? FormData.fromMap(formData)
              : data ?? jsonEncode({}),
          options: Options(
              method: method,
              sendTimeout: 10000,
              receiveTimeout: 10000,
              headers: headerMap,
              contentType: formData != null ? 'multipart/form-data' : null),
          queryParameters: queryParameters);
      if (_isSuccessful(response.statusCode!)) {
        var apiResponse = ApiResponse.fromJson(response.data);
        if (getFullResponse) apiResponse.dioResponse = response;
        return apiResponse;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return ApiResponse(
          success: false,
          data: null,
          message: e.response!.statusMessage,
          code: e.response!.statusCode.toString(),
        );
      }
      if (e.error is SocketException) {
        SocketException socketException = e.error as SocketException;
        return ApiResponse(
          success: false,
          data: null,
          message: socketException.osError != null
              ? socketException.osError!.message
              : '',
          code: socketException.osError != null
              ? socketException.osError!.errorCode.toString()
              : '0',
        );
      }
      return ApiResponse(
        success: false,
        data: null,
        message: e.error != null ? e.error : '',
        code: '-9999',
      );
    }
    throw ('Request NOT successful');
  }

  Future<ApiResponse> uploadFile(
      {String? url,
      String? endpointKey,
      List<FormData>? data,
      Map<String, dynamic>? queryParameters,
      bool getFullResponse = false}) async {
    String? token = 'await AppDataCenter.getToken()';
    Map<String, dynamic> headerMap = {'Authorization': token};

    Response response = await _dio.request(url!,
        data: data,
        options: Options(method: POST, headers: headerMap),
        queryParameters: queryParameters);
    if (_isSuccessful(response.statusCode!)) {
      print(data);
      var apiResponse = ApiResponse.fromJson(response.data);
      if (getFullResponse) apiResponse.dioResponse = response;
      return apiResponse;
    }
    throw ('Request NOT successful :[code=${response.statusCode}, statusMessage=${response.statusMessage}');
  }

  bool _isSuccessful(int i) {
    return i >= 200 && i <= 299;
  }
}
