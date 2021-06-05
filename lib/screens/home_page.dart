import 'dart:developer';
import 'package:flutter/material.dart';

import 'widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
            ),
            const SizedBox(height: 10),
            GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (ctx, index) => Container(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1589838017489-9198a27bd040?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                        fit: BoxFit.cover,
                      ),
                    ))
          ],
        ),
      ),
    ));
  }
}
