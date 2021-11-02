import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  String? code;
  dynamic data;
  String? message;
  bool? success;

  @JsonKey(ignore: true)
  Response? dioResponse;

  ApiResponse({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
