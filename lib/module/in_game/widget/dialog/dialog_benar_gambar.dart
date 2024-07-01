import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class DialogBenarGambar extends StatefulWidget {
  final InGameController controller;
  final String image;
  final String text;
  final StateSetter setState;

  const DialogBenarGambar({
    super.key,
    required this.controller,
    required this.image,
    required this.text,
    required this.setState,
  });

  @override
  State<DialogBenarGambar> createState() => _DialogBenarState();
}

class _DialogBenarState extends State<DialogBenarGambar> {
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
              SizedBox(
                height: 150,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 17.0,
              ),
              Text(
                widget.text,
                style: GoogleFonts.boogaloo(
                  color: const Color(0xff212121),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 17.0,
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
