import 'dart:async';
import 'dart:html';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final List<String> items = ["Shohjahon", "Sardor", "Oybek"];

TextFormField formField = TextFormField(
  initialValue: "WelcomeMyProject@gmail.com",
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  decoration: const InputDecoration(border: InputBorder.none),
  keyboardType: TextInputType.emailAddress,
);
TextFormField formField1 = TextFormField(
    obscureText: true,
    enableSuggestions: false,
    autocorrect: false,
    initialValue: "birbalobirbalo",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    decoration: const InputDecoration(border: InputBorder.none),
    keyboardType: TextInputType.number);
String? SelectedValue;
final RoundedLoadingButtonController _btnController1 =
    RoundedLoadingButtonController();
void _doSomething(RoundedLoadingButtonController controller) async {
  Timer(Duration(seconds: 3), () {
    Get.to(LoginPage());
  });
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Scaffold(
            body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        // DropdownButton2(
        //   onChanged: (value) {
        //     setState(() {
        //       SelectedValue = value as String;
        //     });
        //   },
        //   items: items
        //       .map((item) =>
        //           DropdownMenuItem<String>(value: item, child: Text(item)))
        //       .toList(),
        //   value: SelectedValue,
        // ),
        Text(
          " L  o  g  i  n ",
          style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.w700,
            color: Colors.pink,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Still new here?",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Create new account",
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.w500),
                ))
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EMAIL",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 370,
              height: 45,
              child: TextFormFieldWrapper(
                formField: formField,
                position: TextFormFieldPosition.alone,
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              "PASSWORD",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 370,
              height: 45,
              child: TextFormFieldWrapper(
                formField: formField1,
                position: TextFormFieldPosition.alone,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot password?",
            style: TextStyle(color: Colors.blueGrey, fontSize: 12),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        RoundedLoadingButton(
            color: Colors.pink,
            successColor: Colors.yellow,
            controller: _btnController1,
            height: 60,
            width: 340,
            onPressed: () {
              _doSomething(_btnController1);
            },
            child: Text("L O G I N"))
      ]),
    )));
  }
}
