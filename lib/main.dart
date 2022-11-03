import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ifeanyi_portfolio/constants/constants.dart';
import './screens/widgets/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          elevatedButtonTheme: elevatedButtonThemeData),
      home: const SplashScreen()
    );
  }

}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.greenAccent,
      splash: Lottie.asset('asset/loading_circles.json'),
      nextScreen: HomeScreen(),
      duration: 4000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      animationDuration: Duration(seconds: 4),
      );
  }
}
