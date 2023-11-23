import 'package:udemy_block_tdd/src/authentication/domain/entities/user.dart';

//Its interface
abstract class AuthenticationRepository {
  const AuthenticationRepository();

  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  Future<List<User>> getUsers();
}
