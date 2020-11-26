import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jagsa/src/controllers/dashboard_controller.dart';
import 'package:jagsa/src/models/steam_player_model.dart';

class DashboardView extends GetView<DashboardController> {
  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final profile = Get.arguments as ProfileDisplay;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.signOutAlt),
              onPressed: () {},
            ),
          ],
          title: Text(profile.personaname),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.deepPurple,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  profile.avatarmedium,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.deepPurple[700],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('This is the Drawer'),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text('Close Drawer'),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: TitledBottomNavigationBar(
            activeColor: Colors.white,
            indicatorColor: Colors.deepPurple[700],
            currentIndex: selectedIndex
                .value, // Use this to update the Bar giving a position
            onTap: (index) {
              selectedIndex(index);
            },
            items: [
              TitledNavigationBarItem(
                backgroundColor: Colors.deepPurple,
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: FontAwesomeIcons.home,
              ),
              TitledNavigationBarItem(
                  backgroundColor: Colors.deepPurple,
                  title: Text('Library',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  icon: FontAwesomeIcons.steam),
              TitledNavigationBarItem(
                  backgroundColor: Colors.deepPurple,
                  title: Text('Friends',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  icon: FontAwesomeIcons.peopleArrows),
              TitledNavigationBarItem(
                  backgroundColor: Colors.deepPurple,
                  title: Text('Info',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  icon: FontAwesomeIcons.info),
            ]));
  }
}
