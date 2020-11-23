import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/repositories/isteam_repo.dart';

class LoginViewController extends GetxController {
  LoginViewController({@required this.steamRepository});

  /// inject repo abstraction dependency
  final ISteamRepository steamRepository;

  @override
  void onInit() {
    super.onInit();
  }
}
