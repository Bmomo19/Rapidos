import 'dart:convert';

CountryData countryFromJson(String str) =>
    CountryData.fromJson(json.decode(str));

String countryToJson(CountryData data) => json.encode(data.toJson());

class CountryData {
  CountryData({
    required this.error,
    required this.countries,
  });

  bool error;
  List<Country> countries;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        error: json["error"],
        countries: List<Country>.from(
          json["countries"].map(
            (x) => Country.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    required this.id,
    required this.indicatif,
    required this.nom,
    required this.flag,
  });

  String? id;
  String? indicatif;
  String? nom;
  String? flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        indicatif: json["indicatif"],
        nom: json["nom"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "indicatif": indicatif,
        "nom": nom,
        "flag": flag,
      };
}
