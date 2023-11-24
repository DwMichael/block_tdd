import 'package:udemy_block_tdd/core/usecase/usecase.dart';
import 'package:udemy_block_tdd/core/utils/typedef.dart';
import 'package:udemy_block_tdd/src/authentication/domain/entities/user.dart';
import 'package:udemy_block_tdd/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
