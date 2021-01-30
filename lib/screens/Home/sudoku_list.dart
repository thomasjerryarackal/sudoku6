import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/models/sudoku.dart';
import 'package:sudoku/screens/Home/sudoku_tile.dart';

class SudokuList extends StatefulWidget {
  @override
  _SudokuListState createState() => _SudokuListState();
}

class _SudokuListState extends State<SudokuList> {
  @override
  Widget build(BuildContext context) {

    final sudokus = Provider.of<List<Sudoku>>(context) ?? [];

    return ListView.builder(
      itemCount: sudokus.length,
        itemBuilder: (context ,index){
        return SudokuTile(sudoku: sudokus[index]);
        }
    );
  }
}
