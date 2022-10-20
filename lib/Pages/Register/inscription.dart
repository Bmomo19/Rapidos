import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rapidos/Helpers/utils.dart';
import 'package:rapidos/Routes/route.dart';
import 'package:rapidos/Theme/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  File? _image;
  final picker = ImagePicker();
  bool particulier = true;
  String radioButtonItem = 'Femme';
  int id = 1;
  bool valueEmpty = false;
  TextEditingController nometprenoms = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // TODO Change rapidos link and conditions link
  Uri rapidosUrl = Uri.parse("https://www.google.com");
  Uri condition = Uri.parse("https://www.google.com");

  Future<void> urlLauncher(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future getImage(int position) async {
    PickedFile? pickedFile;
    if (position == 0) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimaryBlue,
        title: const Text(
          "Inscription",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          _image != null
                              ? const CircleAvatar(
                                  radius: 60,
                                  // backgroundImage: MemoryImage(_image!)
                                )
                              : Card(
                                  shape: const CircleBorder(
                                    side: BorderSide.none,
                                  ),
                                  elevation: 1,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                ),
                          Positioned(
                            bottom: -5,
                            left: 70,
                            child: Card(
                              color: colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              elevation: 0,
                              child: const Padding(
                                padding: EdgeInsets.all(1),
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.camera_alt_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (() => setState(() {
                                particulier = true;
                              })),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0),
                              ),
                              color: particulier
                                  ? colorPrimary
                                  : Colors.grey.shade200,
                            ),
                            height: 35,
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: Center(
                              child: Text(
                                "Particulier",
                                style: TextStyle(
                                  color:
                                      particulier ? Colors.white : Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => setState(() {
                                particulier = false;
                              })),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              color: !particulier
                                  ? colorPrimary
                                  : Colors.grey.shade200,
                            ),
                            height: 35,
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: Center(
                              child: Text(
                                "Professionnel",
                                style: TextStyle(
                                  color: !particulier
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: colorPrimary,
                              value: 1,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = 'Homme';
                                  id = 1;
                                });
                              },
                            ),
                            const Text(
                              'Homme',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Radio(
                              activeColor: colorPrimary,
                              value: 2,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = 'Femme';
                                  id = 2;
                                });
                              },
                            ),
                            const Text(
                              'Femme',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Nom & prénoms
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: nometprenoms,
                          decoration: InputDecoration(
                            hintText: "Nom & Prénoms(s)",
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Numéro de Telephone
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: telephone,
                          decoration: InputDecoration(
                            prefixText: "+225 ",
                            prefixStyle: TextStyle(color: Colors.black),
                            hintText: "Numéro de téléphone",
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Email
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Mot de Passe
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: password,
                          decoration: InputDecoration(
                            hintText: "Mot de passe",
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        text: const TextSpan(
                          text: 'En vous inscrivant sur  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Rapidos',
                              style: TextStyle(
                                color: Color(0xFF1877f2),
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: ' vous acceptez les ',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "conditions générales d'utilisation",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ".",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Se connecter
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 16,
                      child: GestureDetector(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 13,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0),
                                      ),
                                      color: colorPrimaryBlue,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Créer mon compte",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                  color: colorPrimary,
                                ),
                                width: MediaQuery.of(context).size.width / 7,
                                height: MediaQuery.of(context).size.height / 13,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Vous avez un compte ?",
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            const BoxUtils()
                                .Navigate(context, PageRoutes.login);
                          },
                          child: Text(
                            " Connectez-vous",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colorPrimary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: colorPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
