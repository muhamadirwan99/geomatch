import 'package:geomatch/core.dart';
import 'package:flutter/material.dart' hide Ink;
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart';

class InGameController extends State<InGameView> {
  static late InGameController instance;
  late InGameView view;

  Map<int, bool> isPlacedPura = {};
  Map<int, bool> isPlacedPendet = {};

  int indexSoal = 1;

  List<JawabanModel> listJawabanPura = [
    JawabanModel(imagePath: 'assets/images/jawaban/pura/1.svg', number: 1),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/2.svg', number: 2),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/3.svg', number: 3),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/4.svg', number: 4),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/5.svg', number: 5),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/6.svg', number: 6),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/7.svg', number: 7),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/8.svg', number: 8),
    JawabanModel(imagePath: 'assets/images/jawaban/pura/9.svg', number: 9),
  ];

  List<JawabanModel> listJawabanPendet = [
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/1.svg', number: 1),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/2.svg', number: 2),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/3.svg', number: 3),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/4.svg', number: 4),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/5.svg', number: 5),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/6.svg', number: 6),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/7.svg', number: 7),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/8.svg', number: 8),
    JawabanModel(imagePath: 'assets/images/jawaban/pendet/9.svg', number: 9),
  ];

  bool isGestureActive = false;
  bool isModelDownloaded = false;

  String recognizedText = '';
  String language = 'en';

  List<StrokePoint> points = [];

  DigitalInkRecognizer digitalInkRecognizer =
      DigitalInkRecognizer(languageCode: 'en');

  Ink ink = Ink();

  void clearPad() {
    setState(() {
      ink.strokes.clear();
      points.clear();
      recognizedText = '';
    });
  }

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
            // color: isPlacedPura[number] == true ? Colors.blue : Colors.green,
            child: isPlacedPura[number] == true
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
            isPlacedPura[number] = true;
            setState(() {});
          }

          if (listJawabanPura
              .every((element) => isPlacedPura[element.number] == true)) {
            playSoundSfx("audio/modal/jawaban_benar.mp3");
            await showDialog(
              context: context,
              builder: (context) => DialogBenarGambar(
                controller: instance,
                setState: setState,
                image: 'assets/images/soal/pura.png',
                text: "Kamu Berhasil Membangun Pura!",
              ),
            );
            setState(() {});
          }
        },
      ),
    );
  }

  List<Widget> buildDragTargets(StateSetter setState) {
    return [
      buildDragTarget(
        9,
        const Offset(71, 16),
        const Size(67, 28),
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

  Widget buildDragTargetSoal2({
    required int number,
    required Offset position,
    required Offset positionPlaceholder,
    required Size size,
    required Size sizePlaceholder,
    required StateSetter setState,
    CustomClipper<Path>? clipper,
    double? angle,
  }) {
    return isPlacedPendet[number] == true
        ? Positioned(
            left: position.dx,
            top: position.dy,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: SvgPicture.asset(
                "assets/images/jawaban/pendet/$number.svg",
                fit: BoxFit.cover,
              ),
            ),
          )
        : Positioned(
            left: positionPlaceholder.dx,
            top: positionPlaceholder.dy,
            child: DragTarget<int>(
              builder: (context, candidateData, rejectedData) {
                return Transform.rotate(
                  angle: angle ?? 0,
                  child: ClipPath(
                    clipper: clipper,
                    child: SizedBox(
                      width: sizePlaceholder.width,
                      height: sizePlaceholder.height,
                      // color: isPlacedPendet[number] == true
                      //     ? Colors.blue
                      //     : Colors.pink,
                    ),
                  ),
                );
              },
              onAcceptWithDetails: (data) async {
                int detail = data.data;

                if (detail == number) {
                  isPlacedPendet[number] = true;
                  setState(() {});
                }

                if (listJawabanPendet.every(
                    (element) => isPlacedPendet[element.number] == true)) {
                  playSoundSfx("audio/modal/jawaban_benar.mp3");

                  await showDialog(
                    context: context,
                    builder: (context) => DialogBenarGambar(
                      controller: instance,
                      setState: setState,
                      image: 'assets/images/soal/tari_pendet.png',
                      text: "Kamu Berhasil Membangun Pola Tari Pendet!",
                    ),
                  );
                  setState(() {});
                }
              },
            ),
          );
  }

  List<Widget> buildDragTargetsSoal2(StateSetter setState) {
    return [
      buildDragTargetSoal2(
        number: 9,
        position: const Offset(77, 0),
        positionPlaceholder: const Offset(86, 9),
        size: const Size(58.56, 58.68),
        sizePlaceholder: const Size(41, 41),
        setState: setState,
        angle: 0.89,
      ),
      buildDragTargetSoal2(
        number: 8,
        position: const Offset(74, 40),
        positionPlaceholder: const Offset(76, 40),
        size: const Size(28.97, 42.05),
        sizePlaceholder: const Size(22, 33),
        setState: setState,
        // clipper: NumberTwoClipper(),
      ),
      buildDragTargetSoal2(
        number: 7,
        position: const Offset(5, 42),
        positionPlaceholder: const Offset(7, 42),
        size: const Size(72.97, 40.46),
        sizePlaceholder: const Size(70, 37),
        setState: setState,
        angle: 0.1,
      ),
      buildDragTargetSoal2(
        number: 6,
        position: const Offset(103, 33),
        positionPlaceholder: const Offset(100, 32),
        size: const Size(32.55, 58.02),
        sizePlaceholder: const Size(33, 58),
        setState: setState,
        clipper: NumberTwoClipper(),
        angle: 0.1,
      ),
      buildDragTargetSoal2(
        number: 5,
        position: const Offset(131, 73),
        positionPlaceholder: const Offset(140, 55),
        size: const Size(76.55, 44.83),
        sizePlaceholder: const Size(70, 55),
        setState: setState,
        clipper: NumberThreeClipper(),
        angle: 0.9,
      ),
      buildDragTargetSoal2(
        number: 4,
        position: const Offset(71, 59),
        positionPlaceholder: const Offset(76, 65),
        size: const Size(58, 58),
        sizePlaceholder: const Size(44, 44),
        setState: setState,
        angle: 0.95,
      ),
      buildDragTargetSoal2(
        number: 3,
        position: const Offset(120, 72),
        positionPlaceholder: const Offset(124, 75),
        size: const Size(55.68, 99.13),
        sizePlaceholder: const Size(56, 100),
        setState: setState,
        clipper: NumberTwoClipper(),
        angle: 3.23,
      ),
      buildDragTargetSoal2(
        number: 2,
        position: const Offset(69, 92),
        positionPlaceholder: const Offset(62, 90),
        size: const Size(59.87, 108),
        sizePlaceholder: const Size(60, 109),
        setState: setState,
        clipper: NumberTwoClipper(),
        angle: 0.1,
      ),
      buildDragTargetSoal2(
        number: 1,
        position: const Offset(69, 140),
        positionPlaceholder: const Offset(69, 140),
        size: const Size(50, 60),
        sizePlaceholder: const Size(50, 60),
        setState: setState,
        clipper: NumberOneClipper(),
      ),
    ];
  }

  switchSoal(int index, StateSetter setState, InGameController controller) {
    switch (index) {
      case 1:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/poleng.png',
          soal: 'Ada berapa jumlah persegi berwarna hitam pada kain poleng?',
          audioSoal: 'audio/kain_poleng/persegi_hitam.mp3',
          jawaban: '4',
        );
      case 2:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/poleng.png',
          soal: 'Ada berapa jumlah persegi berwarna putih pada kain poleng?',
          audioSoal: 'audio/kain_poleng/persegi_putih.mp3',
          jawaban: '1',
        );
      case 3:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/poleng.png',
          soal: 'Berapa jumlah persegi pada kain poleng keseluruhan?',
          audioSoal: 'audio/kain_poleng/keseluruhan.mp3',
          jawaban: '9',
        );
      case 4:
        return Soal1(
          controller: controller,
          setState: setState,
        );
      case 5:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/pura.svg',
          soal: 'Ada berapa jumlah trapesium pada pura tersebut?',
          audioSoal: 'audio/pura/trapesium.mp3',
          jawaban: '4',
        );
      case 6:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/pura.svg',
          soal: 'Ada berapa jumlah persegi panjang pada pura tersebut?',
          audioSoal: 'audio/pura/persegi_panjang_pura.mp3',
          jawaban: '4',
        );
      case 7:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/pura.svg',
          soal: 'Ada berapa jumlah segitiga pada pura tersebut?',
          audioSoal: 'audio/pura/segitiga.mp3',
          jawaban: '1',
        );
      case 8:
        return Soal2(
          controller: controller,
          setState: setState,
        );
      case 9:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/tari_pendet.png',
          soal: 'Ada berapa jumlah persegi pada tangram tersebut?',
          audioSoal: 'audio/tari_pendet/persegi.mp3',
          jawaban: '2',
        );
      case 10:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/tari_pendet.png',
          soal: 'Ada berapa jumlah segitiga pada tangram tersebut?',
          audioSoal: 'audio/tari_pendet/segitiga.mp3',
          jawaban: '5',
        );
      case 11:
        return _soalDrawing(
          setState: setState,
          controller: controller,
          image: 'assets/images/soal/tari_pendet.png',
          soal: 'Ada berapa jumlah persegi panjang pada tangram tersebut?',
          audioSoal: 'audio/tari_pendet/persegi_panjang.mp3',
          jawaban: '1',
        );
      default:
        Container();
    }
  }

  final DigitalInkRecognizerModelManager modelManager =
      DigitalInkRecognizerModelManager();

  // void resetList() {
  //   data = [];
  //   List<String> assetImagesCopy = List<String>.from(assetImagesData);

  //   assetImages = assetImagesCopy..shuffle();
  //   indexBlok = 1;
  // }

  void resetGame() {
    indexSoal = 0;
    // resetList();
    clearPad();
  }

  void recognize(String answer) async {
    try {
      if (ink.strokes.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Recognizing'),
            content: LinearProgressIndicator(),
          ),
          barrierDismissible: false,
        );
        final candidates = await digitalInkRecognizer.recognize(ink);
        recognizedText = candidates[0].text;

        if (recognizedText == "g" && answer == "9") {
          recognizedText = "9";
        }

        if (recognizedText == "l" || recognizedText == "I" && answer == "1") {
          recognizedText = "1";
        }

        Get.back();

        if (recognizedText == answer) {
          if (indexSoal < 11) {
            playSoundSfx("audio/modal/jawaban_benar.mp3");

            playSoundSfx("audio/modal/benar.mp3");

            clearPad();

            showDialog(
              context: context,
              builder: (context) {
                return DialogBenar(
                  controller: instance,
                  setState: setState,
                );
              },
            );
          } else {
            playSoundSfx("audio/modal/materi_selesai.mp3");

            showDialog(
              context: context,
              builder: (context) {
                return const DialogSelesai();
              },
            );
          }
        } else {
          playSoundSfx("audio/modal/jawaban_salah.mp3");

          playSoundSfx("audio/modal/salah.mp3");

          showDialog(
            context: context,
            builder: (context) {
              return const DialogSalah();
            },
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  downloadModel() async {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Downloading model...'),
        content: LinearProgressIndicator(),
      ),
      barrierDismissible: false,
    );

    await modelManager.downloadModel(
      language,
      isWifiRequired: false,
    );

    Get.back();
  }

  switchIndexSoal(String kdSoal) {
    switch (kdSoal) {
      case "mudah":
        indexSoal = 1;
        break;
      case "sedang":
        indexSoal = 4;
      case "sulit":
        indexSoal = 8;
      default:
        indexSoal = 1;
    }
  }

  @override
  void initState() {
    instance = this;
    switchIndexSoal(widget.kdSoal);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      downloadModel();
    });
    listJawabanPura.shuffle();
    listJawabanPendet.shuffle();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

class JawabanModel {
  String imagePath;
  int number;

  JawabanModel({
    required this.imagePath,
    required this.number,
  });
}

class Signature extends CustomPainter {
  Ink ink;

  Signature({required this.ink});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (final stroke in ink.strokes) {
      for (int i = 0; i < stroke.points.length - 1; i++) {
        final p1 = stroke.points[i];
        final p2 = stroke.points[i + 1];
        canvas.drawLine(Offset(p1.x.toDouble(), p1.y.toDouble()),
            Offset(p2.x.toDouble(), p2.y.toDouble()), paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => true;
}

_soalDrawing({
  required StateSetter setState,
  required InGameController controller,
  required String image,
  required String soal,
  required String audioSoal,
  required String jawaban,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 210,
        child: image.contains(".svg")
            ? SvgPicture.asset(
                image,
                fit: BoxFit.cover,
              )
            : Image.asset(
                image,
                fit: BoxFit.cover,
              ),
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
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        soal,
                        style: GoogleFonts.boogaloo(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        playSoundSfx(audioSoal);
                      },
                      child: SvgPicture.asset(
                        "assets/icons/volume.svg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 140,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Silakan tulis jawaban Kamu",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff424242),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            playSoundSfx("audio/button.mp3");
                            controller.clearPad();
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            child: GestureDetector(
                              onPanStart: (DragStartDetails details) {
                                setState(() {
                                  controller.isGestureActive = true;
                                });
                                controller.update();
                                print(
                                    "controller.isGestureActive: ${controller.isGestureActive}");
                                controller.ink.strokes.add(Stroke());
                              },
                              onPanUpdate: (DragUpdateDetails details) {
                                setState(() {
                                  final RenderObject? object =
                                      globalContext.findRenderObject();
                                  final localPosition = (object as RenderBox?)
                                      ?.globalToLocal(details.localPosition);
                                  if (localPosition != null) {
                                    controller.points =
                                        List.from(controller.points)
                                          ..add(StrokePoint(
                                            x: localPosition.dx,
                                            y: localPosition.dy,
                                            t: DateTime.now()
                                                .millisecondsSinceEpoch,
                                          ));
                                  }
                                  if (controller.ink.strokes.isNotEmpty) {
                                    controller.ink.strokes.last.points =
                                        controller.points.toList();
                                  }
                                });

                                controller.update();
                              },
                              onPanEnd: (DragEndDetails details) {
                                setState(() {
                                  controller.isGestureActive = false;
                                  controller.points.clear();
                                });
                                controller.update();
                              },
                              child: CustomPaint(
                                painter: Signature(ink: controller.ink),
                                size: Size.infinite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            InkWell(
              onTap: () {
                controller.recognize(jawaban);
              },
              child: SvgPicture.asset(
                "assets/button/jawab.svg",
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
