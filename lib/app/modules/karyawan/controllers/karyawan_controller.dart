import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KaryawanController extends GetxController {
  //TODO: Implement KaryawanController
  late TextEditingController cNo_Karyawan;
  late TextEditingController cNama;
  late TextEditingController cJabatan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan = firestore.collection('karyawan_npm');

    return karyawan.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference karyawan = firestore.collection('karyawan_npm');
    return karyawan.snapshots();
  }

  void add(
      String no_karyawan, String nama_karyawan, String jabatan_karyawan) async {
    CollectionReference products = firestore.collection("karyawan_npm");

    try {
      await products.add({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data karyawan",
          onConfirm: () {
            cNo_Karyawan.clear();
            cNama.clear();
            cJabatan.clear();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("karyawan_npm").doc(id);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan,
      String id) async {
    DocumentReference karyawanById =
        firestore.collection("karyawan_npm").doc(id);

    try {
      await karyawanById.update({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Karyawan.",
        onConfirm: () {
          cNo_Karyawan.clear();
          cNama.clear();
          cJabatan.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("karyawan_npm").doc(id);

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
    cNo_Karyawan = TextEditingController();
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNo_Karyawan.dispose();
    cNama.dispose();
    cJabatan.dispose();
    super.onClose();
  }
}
