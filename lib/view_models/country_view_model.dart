import '../models/countries_model.dart';

class CountryViewModel {
  final Country country;

  CountryViewModel({this.country});

  String get countryName {
    return this.country.name;
  }

  String get countryCode {
    return this.country.code;
  }

  String get region {
    return this.country.region;
  }
}
