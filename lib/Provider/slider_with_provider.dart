import 'package:flutter/foundation.dart';
class SliderProvider with ChangeNotifier{
double _value=1;
double get value =>_value;
sliderValue(val){
  _value = val;
  notifyListeners();
}

}