import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';



import 'Controller/varcontroller.dart';
import 'Screens/HomePage.dart';


void main() async {
  runApp(const MyApp());
  await readJson();

}

final Controller c = Get.put(Controller());

Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/doctor.json');
  final data = await json.decode(response);

  c.items.value = data[c.indexdata.value.toString()];

  c.data.value = data;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.grey,
      ),

      home:const  HomePage(),
    );
  }
}


