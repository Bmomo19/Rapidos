import 'package:flutter/material.dart';
import 'package:rapidos/Api/Models/countries.dart';

class CountryList extends StatelessWidget {
  const CountryList({Key? key, required this.country}) : super(key: key);

  final List<Country> country;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      children: [GestureDetector()],
    );
  }
}

class Pays extends StatelessWidget {
  final String flag, name;
  const Pays({super.key, required this.flag, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
