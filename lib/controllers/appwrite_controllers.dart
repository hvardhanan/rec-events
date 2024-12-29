import 'package:appwrite/appwrite.dart';

class AppwriteService {
  final Client client = Client();
  late final Account account;
  late final Databases databases;
  late final Storage storage;

  AppwriteService() {
    client.setEndpoint('https://cloud.appwrite.io/v1').setProject('rec-events');
    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
  }

  Future<void> sendEmailOTP(String email) async {
    try {
      final response = await account.createEmailToken(
        userId: ID.unique(),
        email: email,
      );
      print('OTP sent to $email: User ID - ${response.userId}');
    } catch (error) {
      print('Error sending OTP: $error');
    }
  }

  Future<void> verifyEmailOTP(String userId, String otp) async {
    try {
      final session = await account.createSession(
        userId: userId,
        secret: otp,
      );
      print('User logged in successfully: Session ID - ${session.$id}');
    } catch (error) {
      print('Error verifying OTP: $error');
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
      print('Logged out successfully');
    } catch (error) {
      print('Error during logout: $error');
    }
  }

}
