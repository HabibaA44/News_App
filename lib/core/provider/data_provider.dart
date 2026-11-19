import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int currentBottomIndex = 0;

  void updateCurrentIndex(int index) {
    currentBottomIndex = index;
    notifyListeners();
  }
}
