import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan5/services/api_services.dart';

class HomeScreenGetX extends StatelessWidget {
  HomeScreenGetX({super.key});

  final ApiServices controller = Get.put(ApiServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UNGUIDED 14'),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.posts.isEmpty) {
                return const Text(
                  "Tekan tombol GET untuk mengambil data",
                  style: TextStyle(fontSize: 12),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            controller.posts[index]['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          subtitle: Text(
                            controller.posts[index]['body'],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue),
                  child: const Text(
                    'GET',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.createPost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST', style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.updatePost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: const Text('UPDATE', style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.deletePost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
