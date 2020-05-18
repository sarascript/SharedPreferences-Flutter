import 'package:flutter/material.dart';
import 'package:sharedpreferences/src/pages/home_page.dart';
import 'package:sharedpreferences/src/pages/settings_page.dart';
import 'package:sharedpreferences/src/share_preferences/user_preferences.dart';

void main() async {
  // Inicializar las Shared preferences antes de ejecutar la app
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Inicializar las Shared preferences
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Preferences",
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}