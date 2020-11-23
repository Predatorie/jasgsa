import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/models/steam_player_model.dart';
import 'package:jagsa/src/repositories/isteam_repo.dart';

class DashboardController extends GetxController with StateMixin<Player> {
  DashboardController({@required this.steamRepository});

  /// inject repo abstraction dependency
  final ISteamRepository steamRepository;

  @override
  void onInit() {
    super.onInit();

    /// if we have a stored steam if go fetch latest player profile...
    var steamId = '';

    // show loading on start, data on success
    // and error message on error with 0 boilerplate
    steamRepository.getPlayer(steamId).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
