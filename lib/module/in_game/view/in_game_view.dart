import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class InGameView extends StatefulWidget {
  final String kdSoal;

  const InGameView({
    super.key,
    required this.kdSoal,
  });

  Widget build(context, InGameController controller) {
    controller.view = this;

    return Scaffold(
      body: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_ingame.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                playSoundSfx("audio/button.mp3");
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                "assets/button/back.svg",
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                playSoundSfx("audio/button.mp3");
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                "assets/button/home_icon.svg",
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff0D47A1),
                                  Color(0xff64B5F6),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: Border.all(
                                width: 4,
                                color: Colors
                                    .transparent, // Temporary color for border gradient
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffD5EBFD),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: controller.switchSoal(
                                  controller.indexSoal,
                                  setState,
                                  controller,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  State<InGameView> createState() => InGameController();
}
