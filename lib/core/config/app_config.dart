class AppConfig {
  final String baseUrl;
  const AppConfig._(this.baseUrl);

  static const devLan = AppConfig._('http://192.168.31.195:8080/');
  // static const devLan = AppConfig._('http://localhost:8080/');
}