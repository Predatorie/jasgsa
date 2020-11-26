import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/controllers/loginview_controller.dart';
import 'package:jagsa/src/models/result_model.dart';
import 'package:jagsa/src/models/steam_player_model.dart';

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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.deepPurple,
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurpleAccent,
        label: Text('Connect'),
        icon: Icon(
          FontAwesomeIcons.steam,
        ),
        onPressed: () async {
          var result = await controller.steamRepository.getUserProfileAsync(
            steamId: controller.steamIdController.text,
          );

          if (result.isSuccess) {
            await Get.offAllNamed('/dashboard', arguments: result.value);
          } else {
            _showSnackBarMessage(context, result);
          }
        },
      ),
    );
  }

  void _showSnackBarMessage(
      BuildContext context, Result<ProfileDisplay> result) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '${result.errorMessage}',
              maxLines: 2,
            ),
          ],
        )));
  }
}
