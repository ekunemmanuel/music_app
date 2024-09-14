import '../models/user_model.dart';

abstract class AuthRepository {
  Future<User> signUp(String email, String password);
  Future<User> logIn(String email, String password);
  Future<void> logOut();
}
