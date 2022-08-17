import 'package:cart_provider/dummyData/dummydata.dart';
import 'package:flutter/material.dart';
import '../dummyData/modelData.dart';

class PhoneProvider extends ChangeNotifier {
  List<ModelData> cart = [];
  List index = [];
  List qontity_List = [];
  int total_product = 0;
  int product_qontity = 1;
  double total_price = 0;

  void addToCart(int i) {
    total_price = total_price + Dummy_product[i].price!.toDouble();
    total_product++;
    cart.add(Dummy_product[i]);
    qontity_List.add(product_qontity);
    index.add(i);
    notifyListeners();
  }

  void addFromCart(int i) {
    total_price = total_price + cart[i].price!.toDouble();
    total_product++;
    qontity_List[i]++;
    notifyListeners();
  }

  void removeFromCart(int i) {
    total_price = total_price - cart[i].price!.toDouble();
    total_product--;
    if (qontity_List[i] == 1) {
      cart.removeAt(i);
      Dummy_product[index[i]].add_cart = false;
    } else {
      qontity_List[i]--;
    }
    notifyListeners();
  }
}
