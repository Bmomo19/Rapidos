// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

class WeatherApiInterceptor implements InterceptorContract {
  BuildContext? context;
  WeatherApiInterceptor({this.context});

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      print('launch request');
      if (context != null) {
        _showAlertDialog(context!);
      }
    } catch (e) {
      print(e);
      Future<void>.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context!);
      });
    }
    // print(data.params);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (context != null) {
      Navigator.pop(context!);
    }
    return data;
  }

  void _showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(children: [
        Image.asset('assets/loading.gif', width: 50),
        const Text(
          "Patientez svp ...",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ]),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0.6),
        // useRootNavigator: false,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void bottomLoading(BuildContext context) {
    Scaffold.of(context).showBottomSheet<void>(
      (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('BottomSheet'),
                ElevatedButton(
                    child: const Text('Close BottomSheet'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        );
      },
    );
  }

  // ignore: unused_element
  void _showLoading(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Image.asset('assets/loading.gif', width: 50),
          ),
        );
      }),
    );
  }
}
