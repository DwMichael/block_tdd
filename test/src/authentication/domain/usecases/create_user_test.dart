// Kiedy piszesz kod, powinieneś zawsze zadawać sobie te 3 pytania
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:udemy_block_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:udemy_block_tdd/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

///What does the class depend on
/// Answer -- AuthernticationRepository
// How can we create a fake version of dependency
//Answer -- Use Mocktail
// How do we control what our dependencies do
//Answare -- Using the Mocktail's APIs



void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();
  test(
    'should call the [AuthRepo.createUser]',
    () async {
      //Arrange
      when(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer((_) async => const Right(null));
      //Act
      final result = await usecase(params);

      //Assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        ),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
