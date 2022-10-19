import 'package:flutter/material.dart';
import 'package:rapidos/Pages/Auth/login.dart';
import 'package:rapidos/Pages/Register/firststep.dart';
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
      title: '',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        //  Theme.of(context).textTheme,
      ),
      color: colorPrimaryBlue,
      // Login()
      home: const FirstStep(),
      debugShowCheckedModeBanner: false,
      routes: PageRoutes().routes(),
    );
  }
}
