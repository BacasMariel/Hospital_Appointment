import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.name, this.email, this.type);

  final int id;
  final String name;
  final String email;
  final String type;

  @override
  List<Object> get props => [id, name, email, type];

  static const empty = User(0, '', '', '');

  factory User.fromJson(dynamic json) {
    return User(
      json['id'],
      json['name'],
      json['email'],
      json['type'],
    );
  }
}
