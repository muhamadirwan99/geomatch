import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class InGameController extends State<InGameView> {
  static late InGameController instance;
  late InGameView view;

  Map<int, bool> isPlaced = {};

  int indexSoal = 1;

  List<JawabanPura> listJawabanPura = [
    JawabanPura(imagePath: 'assets/images/jawaban/pura/1.svg', number: 1),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/2.svg', number: 2),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/3.svg', number: 3),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/4.svg', number: 4),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/5.svg', number: 5),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/6.svg', number: 6),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/7.svg', number: 7),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/8.svg', number: 8),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/9.svg', number: 9),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/10.svg', number: 10),
    JawabanPura(imagePath: 'assets/images/jawaban/pura/11.svg', number: 11),
  ];

  Widget buildDragTarget(
      int number, Offset position, Size size, StateSetter setState) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: DragTarget<int>(
        builder: (context, candidateData, rejectedData) {
          return SizedBox(
            width: size.width,
            height: size.height,
            // color: isPlaced[number] == true ? Colors.blue : Colors.green,
            child: isPlaced[number] == true
                ? SvgPicture.asset(
                    "assets/images/jawaban/pura/$number.svg",
                    fit: BoxFit.cover,
                  )
                : Container(),
          );
        },
        onAcceptWithDetails: (data) async {
          int detail = data.data;

          if (detail == number) {
            await showDialog(
              context: context,
              builder: (context) => DialogBenar(
                controller: instance,
                setState: setState,
              ),
            );
            setState(() {});
          }
          // if (detail == number) {
          //   isPlaced[number] = true;
          //   setState(() {});
          // }

          // if (listJawabanPura
          //     .every((element) => isPlaced[element.number] == true)) {
          //   await showDialog(
          //     context: context,
          //     builder: (context) => DialogBenar(
          //       controller: instance,
          //       setState: setState,
          //     ),
          //   );
          //   setState(() {});
          // }
        },
      ),
    );
  }

  List<Widget> buildDragTargets(StateSetter setState) {
    return [
      buildDragTarget(
        11,
        const Offset(100, 0),
        const Size(10, 12),
        setState,
      ),
      buildDragTarget(
        10,
        const Offset(94, 10),
        const Size(22, 14),
        setState,
      ),
      buildDragTarget(
        9,
        const Offset(71, 24),
        const Size(67, 19),
        setState,
      ),
      buildDragTarget(
        8,
        const Offset(90, 42),
        const Size(32, 8),
        setState,
      ),
      buildDragTarget(
        7,
        const Offset(61, 50),
        const Size(88, 19),
        setState,
      ),
      buildDragTarget(
        6,
        const Offset(81, 67),
        const Size(49, 12),
        setState,
      ),
      buildDragTarget(
        5,
        const Offset(51, 79),
        const Size(107, 21),
        setState,
      ),
      buildDragTarget(
        4,
        const Offset(72, 98),
        const Size(66, 13),
        setState,
      ),
      buildDragTarget(
        3,
        const Offset(35, 111),
        const Size(141, 31),
        setState,
      ),
      buildDragTarget(
        2,
        const Offset(50, 141),
        const Size(111, 44),
        setState,
      ),
      buildDragTarget(
        1,
        const Offset(0, 183),
        const Size(210, 18),
        setState,
      ),
    ];
  }

  switchSoal(int index, StateSetter setState) {
    switch (index) {
      case 1:
        return Soal1(
          controller: instance,
          setState: setState,
        );
      case 2:
        return Soal2(
          controller: instance,
          setState: setState,
        );
      default:
        Container();
    }
  }

  @override
  void initState() {
    instance = this;
    listJawabanPura.shuffle();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

class JawabanPura {
  String imagePath;
  int number;

  JawabanPura({
    required this.imagePath,
    required this.number,
  });
}
