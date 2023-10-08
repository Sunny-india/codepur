import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'my_widgets/my_drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String screenName = '/home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawerPage(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height * .8,
          width: double.infinity,
          color: Colors.green,
          child: const Text(
            'Home page',
            style: TextStyle(fontSize: 25),
          ),
        )
            .animate(delay: 1.seconds)
            .rotate(duration: 2.seconds, begin: 1.01, end: 1.02),
      ),
    );
  }
}
