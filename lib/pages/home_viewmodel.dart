import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/themes/resources/resource.dart';

class HomeViewModel extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  PlayerState _playerState = PlayerState.stopped;

  HomeViewModel() {
    _initPlayer();
  }

  PlayerState get playerState => _playerState;

  bool get isPlaying => _playerState == PlayerState.playing;

  bool get isPaused => _playerState == PlayerState.paused;

  bool get isStopped => _playerState == PlayerState.stopped;

  void _initPlayer() {
    _player.setReleaseMode(ReleaseMode.stop);
    _player.onPlayerComplete.listen((_) {
      _playerState = PlayerState.stopped;
      notifyListeners();
    });
    _player.onPlayerStateChanged.listen((state) {
      _playerState = state;
      notifyListeners();
    });
  }

  Future<void> play() async {
    await _player.setSource(AssetSource(Assets.musicBirthday));
    await _player.resume();
    _playerState = PlayerState.playing;
    notifyListeners();
  }

  Future<void> pause() async {
    await _player.pause();
    _playerState = PlayerState.paused;
    notifyListeners();
  }

  Future<void> stop() async {
    await _player.stop();
    _playerState = PlayerState.stopped;
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
