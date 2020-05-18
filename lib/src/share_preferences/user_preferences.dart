import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Get y Set del color secundario
  get secondaryColor {
    return _prefs.getBool("secondaryColor") ?? false; // Si no existe, retorna false
  }

  set secondaryColor(bool value){
    _prefs.setBool("secondaryColor", value);
  }

  // Get y Set del género
  get gender {
    return _prefs.getInt("gender") ?? 1; // Si no existe, retorna 1
  }

  set gender(int value){
    _prefs.setInt("gender", value);
  }

  // Get y Set del nombre
  get name {
    return _prefs.getString("name") ?? ""; // Si no existe, retorna ""
  }

  set name(String value){
    _prefs.setString("name", value);
  }

  // Get y Set de la última página
  get lastPage {
    return _prefs.getString("lastPage") ?? "home"; // Si no existe, retorna la página Home
  }

  set lastPage(String value){
    _prefs.setString("lastPage", value);
  }

}