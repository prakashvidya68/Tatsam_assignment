import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/country_view_model.dart';
import '../view_models/fav_view_model.dart';

class FavCountryList extends StatefulWidget {
  final List<CountryViewModel> country;
  final FavCountriesListViewModel favs;

  FavCountryList({this.country, this.favs});

  @override
  _FavCountryListState createState() => _FavCountryListState();
}

class _FavCountryListState extends State<FavCountryList> {
  @override
  Widget build(BuildContext context) {
    // var favC = Provider.of<FavCountriesListViewModel>(context);
    // print(favCountry);
    return ListView.builder(
      // controller: controller,
      itemCount: this.widget.country.length,
      itemBuilder: (context, index) {
        final country = this.widget.country[index];

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
                country.countryCode,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title: Text(country.countryName),
          subtitle: Text("region: ${country.region}"),
          trailing: IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
            onPressed: () {
              print(widget.favs);
              setState(() {
                widget.favs.toggleFav(
                    country.countryCode, country.countryName, country.region);
              });
            },
          ),
        );
      },
    );
  }
}
