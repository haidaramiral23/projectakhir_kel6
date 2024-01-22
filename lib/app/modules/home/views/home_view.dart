import 'package:bcdx_11312136/app/controllers/auth_controller.dart';
import 'package:bcdx_11312136/app/modules/dashboard/views/dashboard_view.dart';
import 'package:bcdx_11312136/app/modules/event/views/event_add_view.dart';
import 'package:bcdx_11312136/app/modules/event/views/event_view.dart';
import 'package:bcdx_11312136/app/modules/karyawan/views/karyawan_view.dart';
import 'package:bcdx_11312136/app/modules/karyawan/views/karyawan_add_view.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa/views/mahasiswa_add_view.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa/views/mahasiswa_view.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa2/views/mahasiswa2_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return DasboardAdmin();
  }
}

class DasboardAdmin extends StatefulWidget {
  const DasboardAdmin({super.key});

  @override
  State<DasboardAdmin> createState() => _DasboardAdminState();
}

class _DasboardAdminState extends State<DasboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      'title': 'Dashboard',
      'view': DashboardView(),
    },
    {
      'title': 'Data Admin',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView()
    },
    {'title': 'Data Event', 'view': EventView(), 'add': () => EventAddView()},
    // {
    //   'title': 'Data Karyawan',
    //   'view': KaryawanView(),
    //   'add': () => KaryawanAddView()
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(198, 203, 14, 14),
        titleSpacing: 0,
        title: Text(_fragment[_index]['title']),
        actions: [
          IconButton(
            onPressed: () => Get.to(_fragment[_index]['add']),
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(198, 203, 14, 14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    "Haidar Amiral",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(198, 203, 14, 14),
            textColor: Color.fromARGB(198, 203, 14, 14),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Admin'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(198, 203, 14, 14),
            textColor: Color.fromARGB(198, 203, 14, 14),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.event),
            title: Text('Data Event'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(198, 203, 14, 14),
            textColor: Color.fromARGB(198, 203, 14, 14),
          ),
          // ListTile(
          //   onTap: () {
          //     setState(() => _index = 3);
          //     Get.back();
          //   },
          //   leading: Icon(Icons.people),
          //   title: Text('Karyawan 21312090'),
          //   trailing: Icon(Icons.navigate_next),
          //   iconColor: Colors.teal,
          //   textColor: Colors.teal,
          // ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(198, 203, 14, 14),
            textColor: Color.fromARGB(198, 203, 14, 14),
          ),
        ],
      ),
    );
  }
}
