import 'dart:async';
import 'dart:math';

import 'package:codepur/my_widgets/my_drawer_page.dart';
import 'package:codepur/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.light,
    theme: Utils.myLightTheme(),
    // darkTheme: Utils.myDarkTheme(),
    initialRoute: HomePage.screenName,
    routes: {
      HomePage.screenName: (context) => const HomePage(),
      LoginPage.screenName: (context) => const LoginPage(),
      MyDrawerPage.screenName: (context) => const MyDrawerPage(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // takeMeToHomeScreen();
  }

  takeMeToHomeScreen() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomePage.screenName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Transform.rotate(
          angle: pi / 12,
          child: Container(
            color: CupertinoColors.destructiveRed,
            height: MediaQuery.sizeOf(context).height,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
