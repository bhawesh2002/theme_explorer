import 'package:flutter/material.dart';

class ItemsProvider extends ChangeNotifier {
  int _items = 0;

  int get items => _items;

  void incrementItems() {
    _items++;
    notifyListeners();
  }

  void decrementItems() {
    _items != 0 ? _items-- : null;
    notifyListeners();
  }
}
