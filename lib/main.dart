import 'package:flutter/material.dart';
import 'package:tatsam_asignment/view_models/fav_view_model.dart';
import 'screens/countries_page.dart';
import './view_models/countries_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediaQuery Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountriesListViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavCountriesListViewModel(),
          ),
        ],
        child: MovieListPage(
          context: context,
        ),
      ),
    );
  }
}
