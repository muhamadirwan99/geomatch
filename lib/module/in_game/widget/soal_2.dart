import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class Soal2 extends StatefulWidget {
  final InGameController controller;
  final StateSetter setState;

  const Soal2({
    super.key,
    required this.controller,
    required this.setState,
  });

  @override
  State<Soal2> createState() => _Soal2State();
}

class _Soal2State extends State<Soal2> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 210,
                height: 201,
                child: Image.asset(
                  "assets/images/soal/tari_pendet_blank.png",
                ),
              ),
              ...widget.controller.buildDragTargetsSoal2(widget.setState),
            ],
          ),
          SizedBox(
            width: 300,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1565C0),
                    border: Border.all(
                      width: 4,
                      color: const Color(0xff0D47A1),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Susunlah tangram berikut hingga menjadi pola tari pendet!",
                            style: GoogleFonts.boogaloo(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            playSoundSfx(
                              "audio/tari_pendet/susun_tangram.mp3",
                            );
                          },
                          child: SvgPicture.asset(
                            "assets/icons/volume.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  child: Wrap(
                    children: List.generate(
                      widget.controller.listJawabanPendet.length,
                      (index) {
                        return Draggable<int>(
                          data:
                              widget.controller.listJawabanPendet[index].number,
                          feedback: SizedBox(
                            child: SvgPicture.asset(
                              widget.controller.listJawabanPendet[index]
                                  .imagePath,
                            ),
                          ),
                          onDragCompleted: () {
                            setState(() {
                              if (widget.controller.isPlacedPendet[widget
                                      .controller
                                      .listJawabanPendet[index]
                                      .number] ==
                                  true) {
                                widget.controller.listJawabanPendet
                                    .removeAt(index);
                              }
                            });
                          },
                          child: SvgPicture.asset(
                            widget
                                .controller.listJawabanPendet[index].imagePath,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
