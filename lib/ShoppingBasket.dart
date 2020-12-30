import 'package:flutter/material.dart';
import 'package:shopping_app/ShoppingBasketData.dart';
import 'package:shopping_app/ShoppingBasketItem.dart';

class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سبد خرید",
            style: TextStyle(color: Colors.black45, fontFamily: "Vazir")),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black45),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BasketUI(),
    );
  }

  Widget BasketUI() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: ListView.builder(
              itemCount: ShoppingBasketData.newInstance().basketItam.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: ShoppingBasketItem(
                        ShoppingBasketData.newInstance().basketItam[position],
                        removeItem,
                        position),
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Center(
                  child: Text(
                    "پرداخت",style: TextStyle(fontFamily: "Vazir",fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      ShoppingBasketData.newInstance().basketItam.removeAt(index);
    });
  }
}
