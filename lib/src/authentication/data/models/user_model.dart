import 'dart:convert';

import 'package:udemy_block_tdd/src/authentication/domain/entities/user.dart';
import 'package:udemy_block_tdd/core/utils/typedef.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.avatar,
    required super.createdAt,
    required super.name,
  });

  const UserModel.empty()
      : this(
          id: '1',
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          avatar: map['avatar'] as String,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
        );

  UserModel copyWith({
    String? id,
    String? avatar,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }

  DataMap toMap() => {
        'id': id,
        'avatar': avatar,
        'createdAt': createdAt,
        'name': name,
      };

  String toJson() => jsonEncode(toMap());
}
