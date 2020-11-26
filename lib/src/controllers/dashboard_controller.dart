import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/repositories/isteam_repo.dart';

class DashboardController extends GetxController {
  DashboardController({@required this.steamRepository});

  /// inject repo abstraction dependency
  final ISteamRepository steamRepository;

  @override
  void onInit() {
    super.onInit();

    /// get friends list
    /// get games list
  }
}
