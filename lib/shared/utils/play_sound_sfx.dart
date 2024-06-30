import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

Future<void> playSoundSfx(String audio) async {
  final player = AudioPlayer();
  final completer = Completer<void>();

  player.onPlayerComplete.listen((_) {
    completer.complete();
  });

  await player.play(AssetSource(audio));

  await completer.future;
}
