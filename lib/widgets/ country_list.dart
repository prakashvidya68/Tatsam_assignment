import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view_models/country_view_model.dart';
import '../view_models/fav_view_model.dart';

class CountryList extends StatelessWidget {
  final List<CountryViewModel> country;
  final ScrollController controller;
  final List<String> favCountry;

  CountryList({this.country, this.controller, this.favCountry});
  @override
  Widget build(BuildContext context) {
    var favC = Provider.of<FavCountriesListViewModel>(context);
    print(favCountry);
    return ListView.builder(
      controller: controller,
      itemCount: this.country.length,
      itemBuilder: (context, index) {
        final movie = this.country[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink,
            ),
            width: 50,
            height: 100,
            child: Center(
              child: Text(
                movie.countryCode,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title: Text(movie.countryName),
          subtitle: Text("region: ${movie.region}"),
          trailing: IconButton(
            icon: Icon(
              Icons.favorite,
              color:
                  (favCountry.contains(movie.countryCode) ? Colors.pink : null),
            ),
            onPressed: () {
              favC.toggleFav(
                  movie.countryCode, movie.countryName, movie.region);
            },
          ),
        );
      },
    );
  }
}
