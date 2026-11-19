class ApiEndpoint {
  ApiEndpoint._();

 static const String apiKe =
    String.fromEnvironment('NEWS_API_KEY');
  static const String baseUrl="https://newsapi.org/v2/";
  static const String path="/top-headlines";
}