import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guided/view_model/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${controller.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/detail');
                      // Get.to(DetailPage());
                    },
                    child: Text('go to detail'))
              ],
            )),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
              onPressed: controller.getsnackbar,
              child: const Icon(Icons.add_alert)),
          FloatingActionButton(
              onPressed: controller.getdialog,
              child: const Icon(Icons.notification_add_rounded)
          ),
          FloatingActionButton(
              onPressed: controller.getbottomsheet,
              child: const Icon(Icons.arrow_upward)
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
