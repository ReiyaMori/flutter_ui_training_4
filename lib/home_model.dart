import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier{
  int currentIndex = 0;

  void changeIndex(index){
    currentIndex = index;
    notifyListeners();
  }
}