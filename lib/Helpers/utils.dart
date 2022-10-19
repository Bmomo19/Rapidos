import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxTitle extends StatelessWidget {
  final String? title;
  final Color? color;
  const BoxTitle({Key? key, this.title, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title!,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 20,
              color: color ?? const Color(0xFF0078d6),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class BoxUtils extends StatelessWidget {
  const BoxUtils({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  void Snackbar(type, message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: type == 'error' ? Colors.red : Colors.blue,
        content: Text(message),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  // UsersDetect() {
  //   var l = storage.getItem('users');
  //   return l[0];
  // }

  // ignore: non_constant_identifier_names
  Navigate(context, route) {
    Navigator.pushNamed(context, route);
  }

  // ignore: non_constant_identifier_names
  ReplaceRoute(context, route) {
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
