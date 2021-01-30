
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/models/sudoku.dart';
import 'package:sudoku/screens/Home/settings_form.dart';
import 'package:sudoku/screens/Home/sudoku_list.dart';
import 'package:sudoku/service/auth.dart';
import 'package:sudoku/service/database.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingForm(),
        );

      });

    }


    return StreamProvider<List<Sudoku>>.value(
      value: DatabaseService().sudokus,
      child: Scaffold(
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
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text("Settings"),
              onPressed: (){
                _showSettingPanel();
              },
            )
          ],
        ),
        body: SudokuList(),
      ),
    );
  }
}
