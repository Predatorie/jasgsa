import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/repositories/itwitch_repo.dart';
import 'package:jagsa/src/repositories/twitch_repo.dart';
import 'package:jagsa/src/services/formatting_service.dart';

import 'src/repositories/isteam_repo.dart';
import 'src/repositories/steam_repo.dart';

void main() {
  _registerTypes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}

void _registerTypes() {
  Get.lazyPut(() => Dio(), fenix: true);

  /// services
  Get.lazyPut<ISteamRepository>(() => SteamRepository(dio: Get.find()),
      fenix: true);
  Get.lazyPut<ITwitchRepository>(() => TwitchRepository(dio: Get.find()),
      fenix: true);
  Get.lazyPut(() => FormattingService(), fenix: true);
}
