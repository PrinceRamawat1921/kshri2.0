import 'package:flutter/material.dart';
import 'package:kshri2/Screens/sign_in_screen.dart';
import 'package:kshri2/utils/color_themes.dart';

void main() {
  runApp(const Kshri());
}

class Kshri extends StatelessWidget {
  const Kshri({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Kshri",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: const SignInScreen());
  }
}
