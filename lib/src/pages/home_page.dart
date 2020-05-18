import 'package:flutter/material.dart';
import 'package:sharedpreferences/src/share_preferences/user_preferences.dart';
import 'package:sharedpreferences/src/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = "home";
  // Inicializar las Shared preferences
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    // Guardar como última página en Shared preferences
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("User preferences"),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      // Widget menú drawer
      drawer: DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Secondary color: ${prefs.secondaryColor}"),
          Divider(),
          Text("Gender: ${prefs.gender}"),
          Divider(),
          Text("User name: ${prefs.name}"),
          Divider(),
        ],
      ),
    );
  }

}
