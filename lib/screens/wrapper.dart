import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/models/users.dart';
import 'package:sudoku/screens/Home/home.dart';
import 'package:sudoku/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// providing what type of data the user to give
    final user = Provider.of<UserK>(context);

    // return home or authenticate widget
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }

  }
}
