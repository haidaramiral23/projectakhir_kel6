import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  //TODO: Implement EventController
  late TextEditingController cNamaEvent;
  late TextEditingController cTanggal;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference event = firestore.collection('event');

    return event.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference event = firestore.collection('event');
    return event.snapshots();
  }

  void add(String tanggal, String namaevent) async {
    CollectionReference products = firestore.collection("event");

    try {
      await products.add({
        "tanggal": tanggal,
        "namaevent": namaevent,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data event",
          onConfirm: () {
            cTanggal.clear();
            cNamaEvent.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Event.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("event").doc(id);

    return docRef.get();
  }

  void Update(String tanggal, String namaevent, String id) async {
    DocumentReference eventById = firestore.collection("event").doc(id);

    try {
      await eventById.update({
        "tanggal": tanggal,
        "namaevent": namaevent,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Event.",
        onConfirm: () {
          cTanggal.clear();
          cNamaEvent.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Event.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("event").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cTanggal = TextEditingController();
    cNamaEvent = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cTanggal.dispose();
    cNamaEvent.dispose();
    super.onClose();
  }
}
