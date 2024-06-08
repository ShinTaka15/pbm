import 'package:flutter/material.dart';
import 'package:jember_wisataku/View/admin/akun_admin.dart';
import 'package:jember_wisataku/View/admin/kelola_event/read_event.dart';
import 'package:jember_wisataku/View/admin/kelola_wisata/read_wisata.dart';
import 'package:jember_wisataku/View/publik_guest/acara_tahunan.dart';
import 'package:jember_wisataku/View/publik_guest/homepage.dart';
import 'package:jember_wisataku/View/publik_guest/akun_guest.dart';
import 'package:jember_wisataku/View/publik_regis/akun_regis.dart';
import 'package:jember_wisataku/widget/widget_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class nav_publik extends StatefulWidget {
  const nav_publik({Key? key}) : super(key: key);

  @override
  State<nav_publik> createState() => _nav_publikState();
}

class _nav_publikState extends State<nav_publik> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late HomePage homepage;
  late Event acaraTahunan;
  late AkunGuestPage akunGuest;
  // late akun_regis profile;
  // late Akun_Admin akunAdmin;
  // late readWisata homepageAdmin;
  // late readEvent event;
  bool _hasToken = false;
  String? _userRole;

  @override
  void initState() {
    super.initState();
    homepage = HomePage();
    // homepageAdmin = readWisata(title: '');
    // event = readEvent(title: '');
    acaraTahunan = Event();
    akunGuest = AkunGuestPage();
    pages = [homepage, acaraTahunan, akunGuest];
    // profile = akun_regis();
    // akunAdmin = Akun_Admin();
    // _checkToken();
  }

  

  // Future<void> _checkToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('access_token');
  //   _userRole = prefs.getString('role');

  //   setState(() {
  //     _hasToken = token != null;
  //     if (_hasToken) {
  //       if (_userRole == 'admin') {
  //         pages = [homepageAdmin, event, akunAdmin];
  //       } else if (_userRole == 'publik') {
  //         pages = [homepage, acaraTahunan, profile];
  //       } else {
  //         pages = [homepage, acaraTahunan, akunGuest];
  //       }
  //     } else {
  //       pages = [homepage, acaraTahunan, akunGuest];
  //     }
  //   });
  // }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        backgroundColor: Color(0xFF77DD77), // Warna hijau
        unselectedItemColor: Color.fromARGB(255, 62, 62, 62),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        selectedLabelStyle: AppWidget.labelbutton(),
        unselectedLabelStyle: AppWidget.labelbutton(),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
