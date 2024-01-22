import 'package:bcdx_11312136/app/controllers/auth_controller.dart';
import 'package:bcdx_11312136/app/routes/app_pages.dart';
import 'package:bcdx_11312136/guestpage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Event Kampus',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/UNIVERSITASTEKNOKRAT.png/900px-UNIVERSITASTEKNOKRAT.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Masuk sebagai Admin",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Email",
                  fillColor: Color.fromARGB(148, 177, 177, 177),
                  filled: true),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cPass,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Password",
                  fillColor: Color.fromARGB(148, 177, 177, 177),
                  filled: true),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () =>
                  cAuth.login(controller.cEmail.text, controller.cPass.text),
              child: Text("Login"),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                child: Text("Reset Password"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun ?"),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text("Daftar Disini"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GuestPage()),
                        );
                      },
                      child: Text(
                        'MASUK SEBAGAI MAHASISWA',
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            )
            // ),
            // Container(
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => GuestPage()),
            //         );
            //       },
            //       child: Text('Login as Guest')),
            // ),
          ],
        ),
      ),
    );
  }
}
