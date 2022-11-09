import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider_gorouter_counter/data/model/memo.dart';

class WriteViewModel extends ChangeNotifier {
  final _memosRef =
      FirebaseFirestore.instance.collection('memos').withConverter<Memo>(
            fromFirestore: (snapshot, _) => Memo.fromJson(snapshot.data()!),
            toFirestore: (Memo, _) => Memo.toJson(),
          );
  Query<Memo> get memoQuery => _memosRef;

  Future<void> write(String title, String body) async {
    await _memosRef.add(Memo(title: title, body: body));
  }

  bool isValid(String title, String body) {
    return title.isEmpty || body.isEmpty;
  }
}
