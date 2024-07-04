import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class DialogMetode extends StatefulWidget {
  const DialogMetode({
    super.key,
  });

  @override
  State<DialogMetode> createState() => _DialogMetodeState();
}

class _DialogMetodeState extends State<DialogMetode> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 300,
            minWidth: 400,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  "Pilih Level",
                  style: GoogleFonts.boogaloo(
                    color: const Color(0xff212121),
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      const InGameView(
                        kdSoal: "mudah",
                      ),
                    );
                  },
                  child: Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: const Color(0xff16A75C),
                      border: Border.all(
                        color: const Color(0xff008444),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "MUDAH",
                        style: GoogleFonts.balooChettan2(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      const InGameView(
                        kdSoal: "sedang",
                      ),
                    );
                  },
                  child: Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF9500),
                      border: Border.all(
                        color: const Color(0xffFF7500),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "MENENGAH",
                        style: GoogleFonts.balooChettan2(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      const InGameView(
                        kdSoal: "sulit",
                      ),
                    );
                  },
                  child: Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: const Color(0xffD32F2F),
                      border: Border.all(
                        color: const Color(0xffB71B1C),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "MUDAH",
                        style: GoogleFonts.balooChettan2(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
