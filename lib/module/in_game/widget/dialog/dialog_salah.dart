import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class DialogSalah extends StatefulWidget {
  const DialogSalah({super.key});

  @override
  State<DialogSalah> createState() => _DialogSalahState();
}

class _DialogSalahState extends State<DialogSalah> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        side: BorderSide(
          width: 5,
          color: Color(0xffB71B1C),
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
              SvgPicture.asset("assets/icons/status_bad.svg"),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                "Jawaban Kamu Salah!",
                style: GoogleFonts.boogaloo(
                  color: const Color(0xff212121),
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              InkWell(
                onTap: () {
                  playSoundSfx("audio/button.mp3");
                  Get.back();
                },
                child: SvgPicture.asset(
                  "assets/button/coba_lagi.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
