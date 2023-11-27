import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:udemy_block_tdd/core/utils/typedef.dart';
import 'package:udemy_block_tdd/src/authentication/data/models/user_model.dart';
import 'package:udemy_block_tdd/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be a subclass of [User] entity', () {
    //Arrange

    //Act

    //Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with right data', () {
      //Arrange

      //Act
      final result = UserModel.fromMap(tMap);

      //Assert
      expect(result, equals(tModel));
    });
  });
  group('fromJson', () {
    test('should return a [UserModel] with right data', () {
      //Arrange

      //Act
      final result = UserModel.fromJson(tJson);

      //Assert
      expect(result, equals(tModel));
    });
  });
  group('toMap', () {
    test('should return a [Map] with right data', () {
      //Arrange

      //Act
      final result = tModel.toMap();

      //Assert
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] string with right data', () {
      //Arrange

      //Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        'id': "1",
        'avatar': "_empty.avatar",
        'createdAt': "_empty.createdAt",
        'name': "_empty.name",
      });

      //Assert
      expect(result, tJson);
    });
  });
}
