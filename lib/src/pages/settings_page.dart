import 'package:flutter/material.dart';
import 'package:sharedpreferences/src/share_preferences/user_preferences.dart';
import 'package:sharedpreferences/src/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor;
  int _gender;
  String _name = "Sara";

  TextEditingController _textController;

  // Inicializar las Shared preferences
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    // Guardar como última página en Shared preferences
    prefs.lastPage = SettingsPage.routeName;
    _secondaryColor = prefs.secondaryColor;
    _gender = prefs.gender;
    _textController = new TextEditingController(text: prefs.name);
  }

  _setSelectedRadio(int value) {
    // Guardar gender en Shared preferences
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text("Settings", style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          // Widget switch
          SwitchListTile(
            value: _secondaryColor,
            title: Text("Secondary color"),
            onChanged: (value) {
              setState(() {
                // Guardar secondary color en Shared preferences
                prefs.secondaryColor = value;
                _secondaryColor = value;
              });
            },
          ),
          // Widget radio button
          RadioListTile(
            value: 1,
            title: Text("Male"),
            groupValue: _gender,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text("Female"),
            groupValue: _gender,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: "Name",
                  helperText: "Enter your name"
              ),
              onChanged: (value) {
                prefs.name = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
