import 'dart:async';

import 'package:flutter/foundation.dart';
class AuthProvider with ChangeNotifier{
bool _loading = false;
bool get loading => _loading;
bool _visibiltiy = false;
bool get visibile => _visibiltiy;
void visibilitySet(){
  _visibiltiy=!_visibiltiy;
  notifyListeners();
}
void loadingSet(){
  _loading=!_loading;
  notifyListeners();

}
}