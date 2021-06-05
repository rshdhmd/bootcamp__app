import 'dart:developer';
import 'package:flutter/material.dart';

import 'widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            color: Color(0xff075E55),
            title: 'Developer(Noobie)',
            subtitle: 'Muhammed Rashad Hameed',
          ),
          const SizedBox(height: 10),
          Text(
            'Poster Designing',
            style: TextStyle(fontSize: 22, color: Colors.amber),
          )
        ],
      ),
    ));
  }
}
