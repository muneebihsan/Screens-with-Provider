import 'package:flutter/foundation.dart';
class CounterProvider with ChangeNotifier {
  int _count =50;
  int get count => _count;
 void Counterset(){
    _count++;
    notifyListeners();
  }
}