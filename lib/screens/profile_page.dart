import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/ProfileScreen';
  final _formkey = GlobalKey<FormState>();

  void onFormSubmit() {
    print("heui");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onSaved: (_val) {},
              ),
              TextButton(onPressed: () => onFormSubmit(), child: Text('Done'))
            ],
          ),
        ),
      )),
    );
  }

  AppBar customAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
