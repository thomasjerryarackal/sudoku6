import 'package:flutter/material.dart';
import 'package:sudoku/service/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku Main'),
        elevation: 0.0,
        backgroundColor: Colors.purple[500],
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Log out'),
            onPressed: ()async{
              await _auth.signOut();
            },

          ),
        ],
      ),
    );
  }
}
