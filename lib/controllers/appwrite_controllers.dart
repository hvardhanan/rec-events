import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppwriteService {
  final Client client = Client();
  late final Account account;
  late final Databases databases;
  late final Storage storage;

  AppwriteService() {
    client
        .setEndpoint(dotenv.env['API_ENDPOINT']!)
        .setProject(dotenv.env['PROJECT_NAME']!);
        
    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
  }

  /// Create a new user
  Future<void> createUser({
    required String userId,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await account.create(
        userId: userId,
        name: name,
        email: email,
        password: password,
      );
      print('User created successfully: ${user.$id}');
    } on AppwriteException catch (e) {
      print('Error creating user: ${e.message}');
      rethrow;
    }
  }

  Future<Session?> loginEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final session = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );

      print('User logged in successfully: ${session.$id}');
      return session;
    } on AppwriteException catch (e) {
      print('Error logging in: ${e}');
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      // Check if session data exists
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? sessionId = prefs.getString('sessionId');
      if (sessionId != null) {
        // Validate session with Appwrite
        final session = await account.getSession(sessionId: sessionId);
        print('Session is valid: ${session.$id}');
        return true;
      }
      return false;
    } catch (e) {
      print('No valid session found: $e');
      return false;
    }
  }

  /// Save session ID to persistent storage
  Future<void> saveSession(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('sessionId', sessionId);
  }

  /// Clear session data on logout
  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sessionId');
  }

  /// Logout current session
  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
      print('Logged out successfully');
    } on AppwriteException catch (e) {
      print('Error during logout: ${e.message}');
      rethrow;
    }
  }
}
