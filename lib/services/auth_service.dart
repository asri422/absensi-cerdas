import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'api_service.dart';

class AuthService {
  static const _tokenKey = 'auth_token';
  static const _userIdKey = 'user_id';

  // Login
  static Future<User> login(String email, String password) async {
    // TODO: adjust endpoint and response structure per your backend
    final data = await ApiService.post('/auth/login', {
      'email': email,
      'password': password,
    });
    final token = data['token'] as String;
    final userJson = data['user'] as Map<String, dynamic>;
    final user = User.fromJson(userJson);
    await _saveToken(token);
    await _saveUserId(user.id);
    return user;
  }

  // Register
  static Future<User> register({
    required String email,
    required String password,
    required String name,
  }) async {
    // TODO: adjust endpoint and response structure per your backend
    final data = await ApiService.post('/auth/register', {
      'email': email,
      'password': password,
      'name': name,
    });
    final token = data['token'] as String;
    final userJson = data['user'] as Map<String, dynamic>;
    final user = User.fromJson(userJson);
    await _saveToken(token);
    await _saveUserId(user.id);
    return user;
  }

  // Get stored token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Check if logged in
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
  }

  // Private helpers
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<void> _saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }
}
