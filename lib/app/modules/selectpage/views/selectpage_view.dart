// login_page.dart
import 'package:bcdx_11312136/adminpage.dart';
import 'package:bcdx_11312136/guestpage.dart';
import 'package:flutter/material.dart'; // Import halaman tamu

class SelectpageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Page'),
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
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman tamu saat tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              },
              child: Text('Login as Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
