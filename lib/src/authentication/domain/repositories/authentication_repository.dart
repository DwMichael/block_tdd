import 'package:udemy_block_tdd/core/utils/typedef.dart';
import 'package:udemy_block_tdd/src/authentication/domain/entities/user.dart';

//Its interface
abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  ResultFuture<List<User>> getUsers();
}
