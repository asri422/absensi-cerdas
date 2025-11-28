import 'api_service.dart';
import 'auth_service.dart';

class AttendanceService {
  // Check In
  static Future<Map<String, dynamic>> checkIn() async {
    final token = await AuthService.getToken();
    // TODO: adjust endpoint per your backend
    return await ApiService.post('/attendance/check-in', {
      'timestamp': DateTime.now().toIso8601String(),
      'type': 'in',
    }, token: token);
  }

  // Check Out
  static Future<Map<String, dynamic>> checkOut() async {
    final token = await AuthService.getToken();
    // TODO: adjust endpoint per your backend
    return await ApiService.post('/attendance/check-out', {
      'timestamp': DateTime.now().toIso8601String(),
      'type': 'out',
    }, token: token);
  }

  // Get attendance history
  static Future<List<dynamic>> getHistory() async {
    final token = await AuthService.getToken();
    // TODO: adjust endpoint per your backend
    final data = await ApiService.get('/attendance/history', token: token);
    return data['records'] as List<dynamic>;
  }
}
