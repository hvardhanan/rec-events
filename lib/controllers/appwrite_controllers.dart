import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteService {
  final Client client = Client();
  late final Account account;
  late final Databases databases;
  late final Storage storage;

  AppwriteService() {
    client
        .setEndpoint(dotenv.env['API_ENDPOINT']!) // Replace with your Appwrite endpoint
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

  /// Login user with email and password
  Future<Session?> loginEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await account.deleteSessions();
      // Ensure all previous sessions are cleared
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
