import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';
import 'package:geomatch/core_package.dart';
import '../controller/credit_controller.dart';

class CreditView extends StatefulWidget {
  const CreditView({super.key});

  Widget build(context, CreditController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_credit.png'),
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
                    InkWell(
                      onTap: () async {
                        playSoundSfx("audio/button.mp3");
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/button/back.svg",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.70),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/logo_undiksa.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "PROGRAM STUDI MAGISTER PENDIDIKAN ANAK USIA DINI",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "FAKULTAS PASCASARJANA",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "UNIVERSITAS PENDIDIKAN GANESHA",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: DataCredit(
                                      image: "assets/icons/role/idea.svg",
                                      title: "Ide Konsep Permainan",
                                      subtitle: "Noviarta Briliany, S.Pd.",
                                    ),
                                  ),
                                  Expanded(
                                    child: DataCredit(
                                      image: "assets/icons/role/dosen.svg",
                                      title: "Dosen pengampu mata kuliah ",
                                      subtitle:
                                          "Dr. Putu Aditya Antara, S.Pd., M.Pd.",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: DataCredit(
                                      image: "assets/icons/role/dosen.svg",
                                      title: "Dosen pengampu mata kuliah ",
                                      subtitle:
                                          "Dr. I Gede Astawan, S.Pd., M.Pd.",
                                    ),
                                  ),
                                  Expanded(
                                    child: DataCredit(
                                      image: "assets/icons/role/dosen.svg",
                                      title: "Dosen pengampu mata kuliah ",
                                      subtitle:
                                          "Dr. Gede Wira Bayu, S.Pd., M.Pd.",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: DataCredit(
                                      image: "assets/icons/role/desainer.svg",
                                      title: "Desainer",
                                      subtitle: "Aldi Yasin, S.Pd.",
                                    ),
                                  ),
                                  Expanded(
                                    child: DataCredit(
                                      image: "assets/icons/role/programmer.svg",
                                      title: "Programmer",
                                      subtitle: "Muhamad Irwan Ramadhan, S.Pd.",
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
      ),
    );
  }

  @override
  State<CreditView> createState() => CreditController();
}
