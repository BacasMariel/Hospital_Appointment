import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/model.dart';

class UserRepositoryLocal {
  Future<Database?> connection() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'hospital_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, type TEXT, password TEXT, status TEXT)',
        );
      },
      version: 1,
    );

    return database;
  }

  Future<void> insertUsers(User users) async {
    final db = await connection();
    print('insert');
    if (db != null) {
      await db.insert(
        'users',
        users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      print('db is  null');
    }
  }

  Future<void> logInUser(String email, String password) async {
    final db = await connection();
    print('loginlocal');

    if (db != null) {
      final res = await db.rawQuery(
          "SELECT * FROM users WHERE email = '$email' and password = '$password'");

      if (res.length > 0) {
        print(res.first);
      } else {
        print('data is null');
      }
    } else {
      print('database is null');
    }
  }
}
