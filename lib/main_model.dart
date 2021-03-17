import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier{
  int currentIndex = 0;

  void chagePage(index){
    currentIndex = index;
    notifyListeners();
  }

}