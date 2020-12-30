import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Product.dart';
import 'package:shopping_app/ShoppingBasketData.dart';

class DescriptionPager extends StatelessWidget {
  Product _product;

  DescriptionPager(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("فروشگاه",
            style: TextStyle(color: Colors.black45, fontFamily: "Vazir")),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black45),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Builder(
        builder:(context) => Column(
          children: [
            Center(
              child: Image.network(
                _product.imageUrl,
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              _product.price,
              style: TextStyle(
                color: Colors.red[700],
                fontFamily: "Vazir",
                fontSize: 30,
              ),
            ),
            Text(
              _product.productName,
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: "Vazir",
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Text(
                _product.description,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: "Vazir",
                  fontSize: 13,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      print("added to basket ${_product.productName}");
                      ShoppingBasketData.newInstance().basketItam.add(_product);
                      print(ShoppingBasketData.newInstance().basketItam.length);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "${_product.productName}"+" به سبد خرید افزوده شد",
                          style: TextStyle(fontFamily: "Vazir", fontSize: 15),
                        ),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      ),
                      child: Center(
                          child: Text(
                        "افزودن به سبد خرید",
                        style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 18,
                          color: Colors.white
                        ),
                      )
                      ),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 70,
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
        ),
      ),
    );
  }
}
