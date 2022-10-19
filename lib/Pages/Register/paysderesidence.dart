import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rapidos/Api/Models/countries.dart';
import 'package:rapidos/Api/Service/interceptor.dart';
import 'package:rapidos/Api/apirequest.dart';
import 'package:rapidos/Helpers/utils.dart';
import 'package:rapidos/Routes/route.dart';
import 'package:rapidos/Theme/colors.dart';

class PaysDeResidence extends StatefulWidget {
  const PaysDeResidence({super.key});

  @override
  State<PaysDeResidence> createState() => _PaysDeResidenceState();
}

class _PaysDeResidenceState extends State<PaysDeResidence> {
  late BackendService backendService;
  late List<Country>? _countryList = [];
  late bool loading = false;

  @override
  void initState() {
    super.initState();
    backendService = BackendService(
      InterceptedClient.build(interceptors: [
        RapidosApiInterceptor(context: context),
      ]),
    );

    backendService.getCountries()?.then((value) =>
        setState(() => {_countryList = value?.countries, loading = true}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimaryBlue,
        title: const Text(
          "Pays de résidence",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: const Text(
              'Selectionnez votre pays',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (!loading)
            Container(
              height: MediaQuery.of(context).size.height / 2,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          else
            for (var country in _countryList!)
              GestureDetector(
                onTap: (() {
                  const BoxUtils().Navigate(context, PageRoutes.inscription);
                }),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 1,
                              ),
                              width: MediaQuery.of(context).size.width / 7,
                              height: MediaQuery.of(context).size.height / 10,
                              child: Image.network(
                                country.flag.toString(),
                              ),
                            ),
                            Text(
                              country.nom.toString(),
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
