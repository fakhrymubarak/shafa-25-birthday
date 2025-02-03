import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class WishViewModel extends ChangeNotifier {
  final DatabaseReference _database = FirebaseDatabase.instance.ref("wishes");

  String _wishes = "";
  bool _isLoading = true;

  String get wishes => _wishes;

  bool get isLoading => _isLoading;

  WishViewModel() {
    fetchWishes();
  }

  void fetchWishes() {
    _database.onValue.listen((event) {
      final data = event.snapshot.value as String?;

      if (data != null) {
        _wishes = data;
      } else {
        _wishes = "";
      }

      _isLoading = false;
      notifyListeners();
    });
  }
}
