import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geomatch/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      // builder: (context, child) {
      //   return Overlay(
      //     initialEntries: [
      //       OverlayEntry(
      //         builder: (context) {
      //           return ScreenSizeTest(
      //             child: child,
      //           );
      //         },
      //       ),
      //     ],
      //   );
      // },
      title: 'Geomatch',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const HomeView(),
    );
  }
}
