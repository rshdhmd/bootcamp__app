import 'package:bootcamp__app/core/database/userDB.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/ProfileScreen';
  final _formkey = GlobalKey<FormState>();
  String _name = '';

  void onFormSubmit() {
    _formkey.currentState!.save();
    print(_name);

    UserDB _userDB = UserDB();
    _userDB.saveData(name: _name);
  }

  @override
  Widget build(BuildContext context) {
    final _arg = ModalRoute.of(context)!.settings.arguments;
    print(_arg);
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
                onSaved: (_val) {
                  _name = _val!;
                },
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
          Navigator.of(context).pop("name result");
        },
        icon: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
