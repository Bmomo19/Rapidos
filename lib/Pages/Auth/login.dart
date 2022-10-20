import 'package:flutter/material.dart';
import 'package:rapidos/Api/Service/interceptor.dart';
import 'package:rapidos/Api/apirequest.dart';
import 'package:rapidos/Helpers/utils.dart';
import 'package:rapidos/Routes/route.dart';
import 'package:rapidos/Theme/colors.dart';
import 'package:http_interceptor/http_interceptor.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late BackendService backendService;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  late bool valueEmpty = false;

  TextEditingController telephone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    backendService = BackendService(
      InterceptedClient.build(interceptors: [
        RapidosApiInterceptor(context: context),
      ]),
    );
    super.initState();
  }

  @override
  void dispose() {
    telephone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(
                      "assets/logo.png",
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width / 2.2,
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Text(
                                "Connectez-vous",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 15),
                              if (valueEmpty)
                                const Text(
                                  "Renseignez vos identifiants svp",
                                  style: TextStyle(color: Colors.red),
                                ),
                              // Login N° TELEPHONE
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 14,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                          ),
                                          color: Colors.grey.shade300,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                13,
                                        child: const Icon(Icons.phone),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          controller: telephone,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              valueEmpty = true;
                                              return null;
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: valueEmpty
                                                ? const Icon(
                                                    Icons.warning,
                                                    color: Colors.red,
                                                  )
                                                : const Text(""),
                                            hintText: "Numéro de téléphone",
                                            hintStyle:
                                                const TextStyle(fontSize: 14.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                              // Login Mot de Passe
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 14,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                          ),
                                          color: Colors.grey.shade300,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                13,
                                        child: const Icon(Icons.lock),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          obscureText: true,
                                          controller: password,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              valueEmpty = true;
                                              return null;
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: valueEmpty
                                                ? const Icon(
                                                    Icons.warning,
                                                    color: Colors.red,
                                                  )
                                                : const Text(""),
                                            hintText: "Mot de passe",
                                            hintStyle:
                                                const TextStyle(fontSize: 14.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              // Se connecter
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 14,
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
                                            onTap: formState,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  13,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(15.0),
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                ),
                                                color: colorPrimaryBlue,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Se connecter",
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                            ),
                                            color: colorPrimary,
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              13,
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
                              const SizedBox(height: 5),
                              // Mot de passe oublié
                              GestureDetector(
                                onTap: () {
                                  // ignore: avoid_print
                                  print("Mot de passe oublié");
                                },
                                child: const Text(
                                  "J'ai oublié mon mot de passe",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Pas de compte ?",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      const BoxUtils()
                          .Navigate(context, PageRoutes.paysderesidence);
                    },
                    child: Text(
                      " Créez un compte",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void formState() async {
    if (_formKey.currentState!.validate()) {
      if (telephone.text == '' || password.text == '') {
        const BoxUtils().Snackbar('error', 'Verifiez vos saisies ...', context);
      } else {
        // ignore: avoid_print
        print("Telephone ==================>${telephone.text}");
        // ignore: avoid_print
        print("Password ==================>${password.text}");
        const BoxUtils().Navigate(context, PageRoutes.homepage);

        // if (response.statusCode == 400) {
        //   BoxUtils().Snackbar('error', body['message'], context);
        // } else {
        //   BoxUtils().ReplaceRoute(context, PageRoutes.homePage);
        // }
      }
    }
    //   } else {
    //     BoxUtils().Snackbar('error', 'Verifiez vos saisies ...', context);
    //   }
  }
}
