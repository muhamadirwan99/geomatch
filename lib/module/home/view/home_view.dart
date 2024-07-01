import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: IntrinsicHeight(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              playSoundSfx("audio/button.mp3");

                              exit(0);
                            },
                            child: SvgPicture.asset(
                              "assets/button/keluar.svg",
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/logo.svg",
                          ),
                          InkWell(
                            onTap: () {
                              playSoundSfx("audio/button.mp3");
                              Get.to(const CreditView());
                            },
                            child: SvgPicture.asset(
                              "assets/button/info_icon.svg",
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          playSoundSfx("audio/button.mp3");
                          Get.to(const InGameView());
                        },
                        child: SvgPicture.asset(
                          "assets/button/ayo_main.svg",
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
