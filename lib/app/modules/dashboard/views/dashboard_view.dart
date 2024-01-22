import 'package:bcdx_11312136/app/controllers/auth_controller.dart';
import 'package:bcdx_11312136/app/modules/home/controllers/home_controller.dart';
import 'package:bcdx_11312136/app/modules/karyawan/views/karyawan_add_view.dart';
import 'package:bcdx_11312136/app/modules/karyawan/views/karyawan_view.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa/views/mahasiswa_add_view.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa/views/mahasiswa_view.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa2/views/mahasiswa2_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 500,
            height: 200,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/anjay.jpg', fit: BoxFit.fitWidth),
              clipBehavior: Clip.hardEdge,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Event Kampus',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Menyediakan informasi terkait Event yang diselenggarakan kampus Universitas Teknokrat Indonesia.',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 19,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: CarouselSlider(
                items: [
                  Image.network(
                      'https://teknokrat.ac.id/wp-content/uploads/2023/06/teknokrat_university-13062023-0003.jpg'),
                  Image.network(
                      'https://teknokrat.ac.id/wp-content/uploads/2023/04/WhatsApp-Image-2023-04-03-at-13.21.05.jpeg'),
                  Image.network(
                      'https://teknokrat.ac.id/wp-content/uploads/2023/06/teknokrat_university-13062023-0001.jpg'),
                ],
                options: CarouselOptions(
                    height: 300, autoPlay: true, enlargeCenterPage: true)),
          )
        ],
      ),
    );
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
      'title': 'Data Mahasiswa',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView()
    },
    {
      'title': 'Data Dosen',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView()
    },
    {
      'title': 'Data Karyawan',
      'view': KaryawanView(),
      'add': () => KaryawanAddView()
    },
    {
      'title': 'Data Mahasiswa (API PHP)',
      'view': Mahasiswa2View(),
      'add': () => Mahasiswa2View()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
                color: Colors.teal,
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
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Mahasiswa'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Dosen'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Karyawan 21312090'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 4);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Mahasiswa (API PHP)'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.teal,
            textColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
