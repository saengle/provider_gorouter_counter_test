import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider_gorouter_counter/data/model/memo.dart';

class MemoWriteViewModel extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  // final _memosRef =
  //     FirebaseFirestore.instance.collection('memos').withConverter<Memo>(
  //           fromFirestore: (snapshot, _) => Memo.fromJson(snapshot.data()!),
  //           toFirestore: (Memo, _) => Memo.toJson(),
  //         );

  Future writeNote(String title, String body) async {
    // await _memosRef.add(Memo(title: title, body: body));
    final doc = _db.collection('memos').doc();
    await _db.collection('memos').doc(doc.id).set({
      "title": title,
      "body": body,
    });
  }

  bool isValid(String title, String body) {
    return title.isEmpty || body.isEmpty;
  }
}
