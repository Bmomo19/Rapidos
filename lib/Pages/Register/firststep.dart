import 'package:flutter/material.dart';
import 'package:rapidos/Theme/colors.dart';

class FirstStep extends StatefulWidget {
  const FirstStep({super.key});

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: colorPrimaryBlue,
        title: const Text(
          "Pays de résidence",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(child: ListView()),
    );
  }
}
