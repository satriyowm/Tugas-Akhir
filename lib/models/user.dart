// models/user.dart
class User {
  final String uid;
  final String email;

  User({required this.uid, required this.email});
}

// models/child.dart
class Child {
  final String name;
  final String age;
  final String parentId;

  Child({required this.name, required this.age, required this.parentId});
}
