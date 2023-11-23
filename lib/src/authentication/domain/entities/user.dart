class User {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          other.runtimeType == runtimeType &&
          other.id == id &&
          other.name == name;

  int get hashCode => id.hashCode ^ name.hashCode;
}
