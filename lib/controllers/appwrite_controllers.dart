import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  final Client client = Client();
  late final Account account;
  late final Databases databases;
  late final Storage storage;

  AppwriteService() {
    client
        .setEndpoint(
            'https://cloud.appwrite.io/v1') // Replace with your Appwrite endpoint
        .setProject('rec-events');
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
      User? user = await account.get();
      if(user != null) {
        await account.deleteSession(sessionId: user.$id);
      }
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
