import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tatsam_asignment/view_models/countries_list_view_model.dart';
import 'package:tatsam_asignment/view_models/country_view_model.dart';
import 'package:tatsam_asignment/view_models/fav_view_model.dart';
import 'package:tatsam_asignment/widgets/fav_country_list.dart';

class FavCountryScreen extends StatelessWidget {
  // final List<CountryViewModel> favs;
  final FavCountriesListViewModel favs;

  FavCountryScreen({this.favs});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorities"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FavCountryList(
          country: favs.favCountries,
          favs: favs,
        ),
      ),
    );
  }
}
