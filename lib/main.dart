import 'package:flutter/material.dart';
import 'package:instagram/screens/main_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'gl',
            fontSize: 16,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Gb',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              fontFamily: 'Gb',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
