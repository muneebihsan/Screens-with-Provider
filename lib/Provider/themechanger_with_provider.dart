import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class ThemeProvider with ChangeNotifier{
 ThemeMode _theme =ThemeMode.light;
  ThemeMode get theme => _theme;
void themeset(theme){
_theme= theme;
notifyListeners();
}
}