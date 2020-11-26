import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/bindings/dashboard_binding.dart';
import 'package:jagsa/src/bindings/login_binding.dart';
import 'package:jagsa/src/repositories/isteam_repo.dart';
import 'package:jagsa/src/repositories/itwitch_repo.dart';
import 'package:jagsa/src/repositories/twitch_repo.dart';
import 'package:jagsa/src/services/formatting_service.dart';
import 'package:jagsa/src/views/dashboard_view.dart';
import 'package:jagsa/src/views/login_view.dart';
import 'package:http/http.dart' as http;
import 'src/repositories/steam_repo.dart';

void main() {
  _registerTypes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Steam Games Live Streamers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: '/login',
            page: () => LoginView(),
            binding: LoginViewBinding()),
        GetPage(
            name: '/dashboard',
            page: () => DashboardView(),
            binding: DashboardBinding()),
      ],
      initialRoute: '/login',
    );
  }
}

void _registerTypes() {
  Get.put(http.Client());
  Get.put(FormattingService());

  /// services
  Get.put<ISteamRepository>(
    SteamRepository(client: Get.find(), formatterService: Get.find()),
  );
  Get.put<ITwitchRepository>(
    TwitchRepository(client: Get.find()),
  );
}
