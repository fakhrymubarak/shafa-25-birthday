import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert'; // For hashing

class ConfirmationViewModel extends ChangeNotifier {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref("song_hash");

  int _activeMessageIndex = -1;

  bool get isLastMessage => _activeMessageIndex == _errorMessage.length - 1;
  final List<String> _errorMessage = [
    "Wait… are you really Shafaa? 🤨",
    "You don’t seem like the Shafa I know… 🤔",
    "Hmm… something’s suspicious here 👀",
    "Shafaa wouldn’t struggle with this… would she? 🤭",
    "You are not shafaaaa ⁽⁽(੭ꐦ •̀Д•́ )੭*⁾⁾. Get out from my siteee!!!",
  ];

  String _songHash = "";
  String _songAnswer = "";

  bool _isAllowed = false;

  ConfirmationViewModel() {
    fetchSongHashes();
  }

  void fetchSongHashes() {
    _database.onValue.listen((event) {
      final data = event.snapshot.value as String?;

      if (data != null) {
        _songHash = data;
      } else {
        _songHash = "";
      }
    });
  }

  void onAnswerChanged(String value) {
    _songAnswer = value;
  }

  bool checkHashes() {
    String hashedInput = _hashString(_songAnswer);
    _isAllowed = _songHash == hashedInput;
    return _isAllowed;
  }

  String _hashString(String input) {
    return base64Encode(utf8.encode(input));
  }

  String getErrorMessage() {
    if (isLastMessage) _activeMessageIndex = 0;
    return _errorMessage[++_activeMessageIndex];
  }
}
