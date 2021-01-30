import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sudoku/models/sudoku.dart';
import 'package:sudoku/models/users.dart';

class DatabaseService {

  final String uid;

  DatabaseService({this.uid});


  //collection reference
  final CollectionReference sudokuCollection = FirebaseFirestore.instance.collection('sudokus');
  Future updateUserData(String sugars,String name, int strength)async{
    return await sudokuCollection.doc(uid).set({
      'sugars':sugars,
      'name':name,
      'strength':strength,

    });
  }


  // sudoku list from the snapshot
  List<Sudoku> _sudokuListFromSnapshot(QuerySnapshot snapshot){
     return snapshot.docs.map((doc) {
      return Sudoku(
        name:doc.data()["name"] ?? '',
        strenght: doc.data()["strenght"] ?? 0,
        sugar:doc.data()["sugar"] ?? '0',

      );
     }).toList();
  }

  //user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserData(
        uid: uid,
        name: documentSnapshot.data()["name"],
        sugars: documentSnapshot.data()["sugars"],
        strength: documentSnapshot.data()["strength"],
    );
  }


  // get sudoku stream
 Stream<List<Sudoku>> get sudokus{
    return sudokuCollection.snapshots()
    .map(_sudokuListFromSnapshot);
 }

 // get database-user document stream
 Stream<DocumentSnapshot> get userData  {
    return sudokuCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
 }


}