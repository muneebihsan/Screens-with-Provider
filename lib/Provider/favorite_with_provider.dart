import 'package:flutter/foundation.dart';
class FavoriteProvider with ChangeNotifier{
  List<int> _selection =[];
  List<int> get selection => _selection;
  void Favoriteset(index){
    _selection.add(index);
    notifyListeners();
  }
  void Favoriteremove(index){
    _selection.remove(index);
    notifyListeners();
  }
}