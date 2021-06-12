import 'dart:io';

import 'package:bootcamp__app/env/hiveinit.dart';
import 'package:bootcamp__app/screens/home_page.dart';
import 'package:bootcamp__app/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {ProfileScreen.routeName: (ctx) => ProfileScreen()},
      home: HomePage(),
    );
  }
}
