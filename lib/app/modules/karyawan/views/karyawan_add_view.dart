import 'package:bcdx_11312136/app/modules/karyawan/controllers/karyawan_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class KaryawanAddView extends GetView<KaryawanController> {
  const KaryawanAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNo_Karyawan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "no_karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "nama_karyawan"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.cJabatan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "jabatan_karyawan"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNo_Karyawan.text,
                controller.cNama.text,
                controller.cJabatan.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
