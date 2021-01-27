import 'package:flutter/material.dart';
import '../services/web_services.dart';
import './country_view_model.dart';

class CountriesListViewModel extends ChangeNotifier {
  List<CountryViewModel> countries = List<CountryViewModel>();
  List<CountryViewModel> res = [];
  Future<void> fetchMovies() async {
    this.countries.clear();
    res.clear();
    final results = await Webservice().fetchCountries(30, 0);
    res.addAll(results.map((item) => CountryViewModel(country: item)).toList());
    res.sort((a, b) => (a.countryName.compareTo(b.countryName)));
    this.countries = res;
    notifyListeners();
  }

  Future<void> fetchMoreCountries(int noOfCountries, int offset) async {
    final results = await Webservice().fetchCountries(noOfCountries, offset);
    res.addAll(results.map((item) => CountryViewModel(country: item)).toList());
    // res.sort((a, b) => (a.countryName.compareTo(b.countryName)));
    this.countries = res;
    notifyListeners();
  }
}
