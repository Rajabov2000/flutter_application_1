import 'dart:html';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController unameController = TextEditingController();
TextEditingController pwdController = TextEditingController();
String _message = "";
final RoundedLoadingButtonController _btnController2 =
    RoundedLoadingButtonController();
void _doSomething(RoundedLoadingButtonController controller) async {
  Timer(Duration(seconds: 3), () {});
}

TextFormField formField = TextFormField(
    controller: unameController,
    initialValue: "",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    decoration: const InputDecoration(border: InputBorder.none),
    keyboardType: TextInputType.name);
TextFormField formField1 = TextFormField(
    controller: pwdController,
    obscureText: true,
    enableSuggestions: false,
    autocorrect: false,
    initialValue: "",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    decoration: const InputDecoration(border: InputBorder.none),
    keyboardType: TextInputType.name);

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
          // Center(
          //   child: Container(
          //     width: 370,
          //     height: 45,
          //     child: TextFormFieldWrapper(
          //       formField: formField,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Container(
                width: 370,
                height: 45,
                child: TextField(
                  controller: unameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Your name?",
                      hintText: "Enter Your Name",
                      icon: Icon(Icons.person_outline)),
                ),
                // child: TextFormFieldWrapper(
                //   formField: formField1,
                // ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Container(
                width: 370,
                height: 45,
                child: TextField(
                  controller: pwdController,
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Your Password?",
                      hintText: "Enter Your Password",
                      icon: Icon(Icons.person_outline)),
                ),
                // child: TextFormFieldWrapper(
                //   formField: formField1,
                // ),
              ),
            ),
          ),
          RoundedLoadingButton(
              color: Colors.pink,
              successColor: Colors.yellow,
              controller: _btnController2,
              height: 60,
              width: 340,
              onPressed: () {
                Get.snackbar("Your Password", "Your name Saved ",
                    snackPosition: SnackPosition.BOTTOM);
                _doSomething(_btnController2);
                var uname = unameController.text;
                var pwd = pwdController.text;
                setState(() {
                  _message = "Your name : $uname\n Your Password : $pwd";
                });
              },
              child: Text("R E S U L T")),
          Text(_message)
        ]),
      ),
    );
  }
}
