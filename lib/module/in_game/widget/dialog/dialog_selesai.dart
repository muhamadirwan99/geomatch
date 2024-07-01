import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class DialogSelesai extends StatefulWidget {
  const DialogSelesai({
    super.key,
  });

  @override
  State<DialogSelesai> createState() => _DialogSelesaiState();
}

class _DialogSelesaiState extends State<DialogSelesai> {
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
              SvgPicture.asset("assets/images/great_job.svg"),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                "Kamu Berhasil Menyelesaikan Permainan!",
                style: GoogleFonts.boogaloo(
                  color: const Color(0xff212121),
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32.0,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
