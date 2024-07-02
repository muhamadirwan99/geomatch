import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

  void playBackgroundMusic() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.bgm.play('bg.mp3');
  }

  @override
  void initState() {
    instance = this;
    playBackgroundMusic();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
