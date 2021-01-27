import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tatsam_asignment/screens/fav_country_screen.dart';
import 'package:tatsam_asignment/view_models/country_view_model.dart';
import 'package:tatsam_asignment/view_models/fav_view_model.dart';
import '../view_models/countries_list_view_model.dart';
import '../widgets/ country_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  final BuildContext context;

  MovieListPage({this.context});
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  ScrollController _controller;
  int counter = 30;

  bool timeUP = false;

  @override
  void initState() {
    startTime();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    Provider.of<CountriesListViewModel>(context, listen: false).fetchMovies();

    Provider.of<FavCountriesListViewModel>(context, listen: false).fetchFav();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, () {
      setState(() {
        timeUP = true;
      });
    });
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      Provider.of<CountriesListViewModel>(context, listen: false)
          .fetchMoreCountries(20, counter);
      counter += 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CountriesListViewModel>(context);
    final favC = Provider.of<FavCountriesListViewModel>(context);
    List<CountryViewModel> favs = favC.favCountries;
    List<String> favCo;

    favCo = favs.map((e) => e.countryCode).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavCountryScreen(
                favs: favC,
              ),
            ),
          );
        },
        label: Text("Favorites"),
        icon: Icon(Icons.star),
      ),
      appBar: AppBar(title: Text("Countries")),
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<CountriesListViewModel>(context, listen: false)
              .fetchMovies();
        },
        child: timeUP && vm.countries.isEmpty
            ? ListView(children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child:
                            Text("Please Check your internet Connection...")))
              ])
            : Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: vm.countries.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : CountryList(
                        country: vm.countries,
                        controller: _controller,
                        favCountry: favCo,
                      ),
              ),
      ),
    );
  }
}
