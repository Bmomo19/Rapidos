import 'package:flutter/material.dart';
import 'package:rapidos/Pages/Auth/login.dart';
import 'package:rapidos/Routes/route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapidos/Theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      color: colorPrimaryBlue,
      home: const Login(),
      debugShowCheckedModeBanner: false,
      routes: PageRoutes().routes(),
    );
  }
}
