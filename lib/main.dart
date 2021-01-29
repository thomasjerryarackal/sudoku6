import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/models/users.dart';
import 'package:sudoku/screens/wrapper.dart';
import 'package:sudoku/service/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserK>.value(
      child: MaterialApp(
        home: Wrapper(),
      ),
      value: AuthService().user,
    );
  }
}

