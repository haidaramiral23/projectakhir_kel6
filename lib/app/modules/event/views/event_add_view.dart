import 'package:bcdx_11312136/app/modules/event/controllers/event_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EventAddView extends GetView<EventController> {
  const EventAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Event'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cTanggal,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Tanggal"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNamaEvent,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cTanggal.text,
                controller.cNamaEvent.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
