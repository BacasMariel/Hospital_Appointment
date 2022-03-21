import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.name, this.email);

  final int id;
  final String name;
  final String email;

  @override
  List<Object> get props => [id, name, email];

  static const empty = User(0, '', '');

  factory User.fromJson(dynamic json) {
    return User(
      json['id'],
      json['name'],
      json['email'],
    );
  }
}
