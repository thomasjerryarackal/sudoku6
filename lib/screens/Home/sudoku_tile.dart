import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/models/sudoku.dart';


class SudokuTile extends StatelessWidget {
  final Sudoku sudoku;
  SudokuTile({this.sudoku});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 1.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.purple[sudoku.strenght],
          ),
          title: Text(sudoku.name),
          subtitle: Text('Takes ${sudoku.strenght} sugar(s)'),
        ),
      ),
    );
  }
}

