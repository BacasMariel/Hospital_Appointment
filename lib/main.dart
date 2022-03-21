import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/dashboard/api/data_api.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';
import 'screens/firstpage.dart';

// //To access the static files and disable flutter bloc uncomment this one and comment the other one

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FirstPage(),
//     );
//   }
// }

// Main Flutter Bloc File -> (comment this one)

void main() {
  runApp(MyApp(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
    dataRepository: DataRepository(),
  ));
}
