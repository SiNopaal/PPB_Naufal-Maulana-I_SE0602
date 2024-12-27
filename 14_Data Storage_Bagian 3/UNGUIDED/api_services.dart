import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices extends GetxController {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  var posts = <dynamic>[].obs; 
  var isLoading = false.obs; 

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts.value = json.decode(response.body);
        _showSnackbar('Success', 'Data berhasil diambil!', const Color.fromARGB(255, 238, 110, 153));
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      _showSnackbar('Error', e.toString(), Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPost() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        posts.add({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'id': posts.length + 1,
        });
        _showSnackbar('Success', 'Data berhasil ditambahkan!', const Color.fromARGB(255, 238, 110, 153));
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      _showSnackbar('Error', e.toString(), Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePost() async {
    isLoading.value = true;
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );

      if (response.statusCode == 200) {
        final index = posts.indexWhere((post) => post['id'] == 1);
        if (index != -1) {
          posts[index] = {
            'id': 1,
            'title': 'Updated Title',
            'body': 'Updated Body',
            'userId': 1,
          };
          _showSnackbar('Success', 'Data berhasil diperbarui!', const Color.fromARGB(255, 238, 110, 153));
        }
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      _showSnackbar('Error', e.toString(), Colors.red);
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> deletePost() async {
  isLoading.value = true;
  try {
    final response = await http.delete(Uri.parse('$baseUrl/posts/1'));

    if (response.statusCode == 200) {
      posts.removeWhere((post) => post['id'] == 1);
      _showSnackbar('Success', 'Data berhasil dihapus!', const Color.fromARGB(255, 238, 110, 153));
    } else {
      throw Exception('Failed to delete post');
    }
  } catch (e) {
    _showSnackbar('Error', e.toString(), Colors.red);
  } finally {
    isLoading.value = false;
  }
}

  void _showSnackbar(String title, String message, Color backgroundColor) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: Colors.black,
    borderRadius: 8,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    icon: Icon(
      title == 'Success' ? Icons.check_circle : Icons.error,
      color: Colors.black,
    ),
  );
}

}
