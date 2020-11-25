import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/controllers/loginview_controller.dart';

class LoginView extends GetView<LoginViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,

        /// Steam Games Live Streamers App
        title: Text('SGLS APP'),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 40,
            ),
            Icon(
              FontAwesomeIcons.steamSymbol,
              size: 120,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: 'Steam Id',
                    errorMaxLines: 1,
                    focusColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      FontAwesomeIcons.userNinja,
                      color: Colors.white,
                    )),
                controller: controller.steamIdController,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                print('pop up info on steam Id');
              },
              child: Text('where can i find my Steam Id?',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
