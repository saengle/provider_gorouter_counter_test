import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class memoListViewModel extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  // db에 있는 모든 애들을 가져와서 stream으로 내보냄
  Stream<QuerySnapshot> get memoStream => _db.collection('memos').snapshots();
  // bool isNotEmpty(String imageUrl) {
  //   return imageUrl.isNotEmpty ;
  // }
}
