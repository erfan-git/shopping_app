import 'package:shopping_app/Product.dart';

class ShoppingBasketData {
  static ShoppingBasketData _instance;
  List<Product> _basketItam;

  ShoppingBasketData(){
    _basketItam = List<Product>();
  }


  List<Product> get basketItam => _basketItam;

  set basketItam(List<Product> value) {
    _basketItam = value;
  }

  static ShoppingBasketData newInstance(){
    if(_instance == null){
      _instance = ShoppingBasketData();
    }
    return _instance;
  }
}