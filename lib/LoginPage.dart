import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shopping_app/LoginResponseModel.dart';
import 'package:shopping_app/main.dart';

import 'StoreMainMenuPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ورود",
            style: TextStyle(color: Colors.black45, fontFamily: "Vazir")),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LoginUI(),
    );
  }

  Widget LoginUI() {
    return Builder(
      builder: (context) => Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50),
            child: Text(
              "LogIn",
              style: TextStyle(
                  fontFamily: "varelaround-regular",
                  fontSize: 55,
                  color: Colors.grey[400]),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          hintText: "نام کاربری",
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.grey[500],
                            ),
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontFamily: "Vazir"),
                      controller: usernameController,
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[200],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          hintText: "رمز عبور",
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.lock_outline,
                              color: Colors.grey[500],
                            ),
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontFamily: "Vazir"),
                      controller: passwordController,
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[200],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red[900],
                      child: InkWell(
                        onTap: () {
                          sendLoginRequest(
                              context: context,
                              username: usernameController.text,
                              password: passwordController.text);
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "ورود",
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void sendLoginRequest(
      {@required BuildContext context,
      @required String username,
      @required String password}) async {
    var url = "http://welearnacademy.ir/flutter/api/?type=login";
    var body = Map<String, dynamic>();
    body["username"] = username;
    body["password"] = password;
    Response response = await post(url, body: body);
    if (response.statusCode == 200) {
      //successful
      var loginJson = json.decode(utf8.decode(response.bodyBytes));
      var model = LoginResponseModel(loginJson["result"], loginJson["message"]);
      if (model.result == 0) {
        showMySnackBar(context, model.message);
      } else if (model.result == 1) {
        showMySnackBar(context, model.message);
        Navigator.of(context).pushReplacement(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return Store();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondAnimation,
                Widget child) {
              return ScaleTransition(
                child: child,
                scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
              );
            }));
      }
    } else {
      //error
      showMySnackBar(context, "درخواست با خطا مواجه شد");
    }
  }

  void showMySnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message.toString(),
        style: TextStyle(fontFamily: "Vazir", fontSize: 15),
      ),
    ));
  }
}
