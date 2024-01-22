import 'package:bcdx_11312136/adminpage.dart';
import 'package:bcdx_11312136/app/controllers/auth_controller.dart';
import 'package:bcdx_11312136/app/modules/login/views/login_view.dart';
import 'package:bcdx_11312136/app/routes/app_pages.dart';
import 'package:bcdx_11312136/app/utils/loading.dart';
import 'package:bcdx_11312136/firebase_options.dart';
import 'package:bcdx_11312136/guestpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CAuth = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: CAuth.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HOME
                    : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }
        return Loading();
      },
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Event Kampus'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Form login dapat ditambahkan di sini
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman tamu saat tombol ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GuestPage()),
              );
            },
            child: Text('Login as Mahasiswa'),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigasi ke halaman tamu saat tombol ditekan
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => AdminPage()),
          //     );
          //   },
          //   child: Text('Login as Admin'),
          // ),
        ],
      ),
    ),
  );
}
