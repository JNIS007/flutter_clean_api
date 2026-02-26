class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.freeapi.app/api/v1';

  static const String users = '/public/randomusers';

  static String getUserById(String id) => '/public/randomusers/$id';
}
