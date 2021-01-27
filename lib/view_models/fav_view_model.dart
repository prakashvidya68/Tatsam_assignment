import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tatsam_asignment/models/countries_model.dart';
import 'package:tatsam_asignment/models/fav_countries_model.dart';
import 'package:tatsam_asignment/view_models/country_view_model.dart';

class FavCountriesListViewModel extends ChangeNotifier {
  final FavCountry favCountry;

  FavCountriesListViewModel({this.favCountry});

  String get countryCode {
    return this.favCountry.code;
  }

  List<CountryViewModel> favCountries = List<CountryViewModel>();
  List<CountryViewModel> res = [];
  List<CountryViewModel> favC = [];
  Future<void> fetchFav() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> fav = prefs.getStringList("favContries") ?? [];
    for (int i = 0; i < fav.length; i += 3) {
      favCountries.add(CountryViewModel(
          country:
              Country(code: fav[i], name: fav[i + 1], region: fav[i + 2])));
    }
    // this.favCountries = res;
    notifyListeners();
  }

  Future<void> toggleFav(String code, String name, String region) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> fav = prefs.getStringList("favContries") ?? [];
    if (fav.contains(code)) {
      int dex = fav.indexOf(code);
      fav.removeAt(dex);
      fav.removeAt(dex);
      fav.removeAt(dex);
    } else {
      fav.addAll([code, name, region]);
    }

    prefs.setStringList("favContries", fav);
    res.clear();
    for (int i = 0; i < fav.length; i += 3) {
      res.add(CountryViewModel(
          country:
              Country(code: fav[i], name: fav[i + 1], region: fav[i + 2])));
    }

    favCountries = res;
    // print("dafa");
    // print(favCountries);
    notifyListeners();
  }

  // void getFavC() {
  //   favCountries.
  // }
}
