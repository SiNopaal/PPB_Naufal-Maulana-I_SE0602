import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  var notes = <Map<String, String>>[].obs;

  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }

  void snackBar() {
    Get.snackbar(
      'Tidak dapat menyimpan', 'harap isi dengan benar',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10)
    );
  }

  void confirmDelete(BuildContext context, int index) {
    Get.defaultDialog(
      title: 'Konfirmasi Hapus',
      middleText: 'Apakah yakin untuk menghapus catatan ini?',
      textConfirm: 'Hapus',
      textCancel: 'Batal',
      confirmTextColor: Colors.white,
      onConfirm: () {
        notes.removeAt(index);
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Catatan berhasil dihapus',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10)
        );
      },
      onCancel: () {
      },
    );
  }
}
