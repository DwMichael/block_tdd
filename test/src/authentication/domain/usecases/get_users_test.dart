// Kiedy piszesz kod, powinieneś zawsze zadawać sobie te 3 pytania
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:udemy_block_tdd/src/authentication/domain/entities/user.dart';
import 'package:udemy_block_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:udemy_block_tdd/src/authentication/domain/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

///What does the class depend on
/// Answer -- AuthernticationRepository
// How can we create a fake version of dependency
//Answer -- Use Mocktail
// How do we control what our dependencies do
//Answare -- Using the Mocktail's APIs

void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];
  test(
    'should call the [AuthRepo.getUsers] and return [list<User>]',
    () async {
      //Arrange
      when(() => repository.getUsers())
          .thenAnswer((_) async => const Right(tResponse));
      //Act
      final result = await usecase();

      //Assert
      expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
      verify(() => repository.getUsers()).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
