import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class DialogBenar extends StatefulWidget {
  final InGameController controller;
  final StateSetter setState;

  const DialogBenar({
    super.key,
    required this.controller,
    required this.setState,
  });

  @override
  State<DialogBenar> createState() => _DialogBenarState();
}

class _DialogBenarState extends State<DialogBenar> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        side: BorderSide(
          width: 5,
          color: Color(0xff0D47A1),
        ),
      ),
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 300,
            maxWidth: 400,
          ),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/status_ok.svg"),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                "Jawaban Kamu Benar!",
                style: GoogleFonts.boogaloo(
                  color: const Color(0xff212121),
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      playSoundSfx("audio/button.mp3");
                      Get.back();
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      "assets/button/home.svg",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      playSoundSfx("audio/button.mp3");
                      widget.controller.indexSoal++;
                      widget.setState(() {});
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      "assets/button/next.svg",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
