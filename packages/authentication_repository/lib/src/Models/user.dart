import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      this.id, this.name, this.email, this.type, this.password, this.status);

  final int id;
  final String name;
  final String email;
  final String type;
  final String password;
  final String status;

  @override
  List<Object> get props => [id, name, email, type, password, status];

  static const empty = User(0, '', '', '', '', '');

  factory User.fromJson(dynamic json) {
    return User(
      json['id'],
      json['name'],
      json['email'],
      json['type'],
      json['password'],
      json['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'type': type,
      'password': password,
      'status': status
    };
  }
}
