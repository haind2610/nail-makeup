enum Flavor { DEV, STAGING, PRODUCTION }

class AppConfig {
  final String name;
  final bool log;
  final bool mock;
  final String baseApi;
  final Flavor flavor;

  const AppConfig({
    required this.name,
    required this.log,
    required this.mock,
    required this.baseApi,
    required this.flavor,
  });
  static AppConfig? _instance;

  static AppConfig get instance => _instance!;

  factory AppConfig.fromFlavor({Flavor flavor = Flavor.DEV}) {
    switch (flavor) {
      case Flavor.DEV:
        _instance = AppConfig(
          name: 'DEV',
          log: true,
          mock: true,
          baseApi: '',
          flavor: Flavor.DEV,
        );
        break;
      case Flavor.STAGING:
        _instance = AppConfig(
          name: 'STAGING',
          log: true,
          mock: false,
          baseApi: '',
          flavor: Flavor.STAGING,
        );
        break;
      case Flavor.PRODUCTION:
        _instance = AppConfig(
          name: 'PRODUCTION',
          log: false,
          mock: false,
          baseApi: '',
          flavor: Flavor.PRODUCTION,
        );
        break;
      default:
        _instance = AppConfig(
          name: 'DEV',
          log: true,
          mock: true,
          baseApi: '',
          flavor: Flavor.DEV,
        );
    }
    return _instance!;
  }
}
