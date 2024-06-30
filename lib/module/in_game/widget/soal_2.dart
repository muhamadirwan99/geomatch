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
              Image.asset(
                "assets/images/soal/tari_pendet_blank.png",
              ),
              ...widget.controller.buildDragTargets(setState),
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
                            "Ayo susun bangunan Pura tersebut yang terdiri dari beberapa bentuk Gabungan geometri",
                            style: GoogleFonts.boogaloo(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        InkWell(
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
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    widget.controller.listJawabanPura.length,
                    (index) {
                      return Draggable<int>(
                        data: widget.controller.listJawabanPura[index].number,
                        feedback: SizedBox(
                          child: SvgPicture.asset(
                            widget.controller.listJawabanPura[index].imagePath,
                          ),
                        ),
                        onDragCompleted: () {
                          setState(() {
                            if (widget.controller.isPlaced[widget.controller
                                    .listJawabanPura[index].number] ==
                                true) {
                              widget.controller.listJawabanPura.removeAt(index);
                            }
                          });
                        },
                        child: SvgPicture.asset(
                          widget.controller.listJawabanPura[index].imagePath,
                        ),
                      );
                    },
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
