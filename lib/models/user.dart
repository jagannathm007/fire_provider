import 'dart:convert';

User? userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User? data) => json.encode(data!.toJson());

class User {
  User({
    this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
  });

  String? id;
  String? name;
  String? email;
  String? mobile;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "password": password,
  };
}
