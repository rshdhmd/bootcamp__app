import 'package:bootcamp__app/model/photos_model.dart';
import 'package:bootcamp__app/screens/profile_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp__app/env/keys.dart' as config;
import 'package:hive/hive.dart';
import 'widgets/top_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    final _dioinstance = Dio();

    _dioinstance.options.headers['Authorization'] =
        "Client-ID ${config.unsplash_key}";

    final _fetchData =
        await _dioinstance.get('https://api.unsplash.com/photos');
    for (var _items in _fetchData.data) {
      setState(() {
        _photosData.add(
            PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
      });
      _photosData.add(
          PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
    }
    print("object");
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: Hive.box('profile').listenable(),
                builder: (BuildContext context, Box value, Widget? child) =>
                    TopBar(
                  color: Colors.deepOrange,
                  title: 'Developer(Noobie)',
                  subtitle: value.get('name'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Poster Designing',
                style: TextStyle(fontSize: 22, color: Colors.amber),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: _photosData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (ctx, index) => Container(
                        child: Image.network(
                          _photosData[index].imgURL,
                          fit: BoxFit.cover,
                        ),
                      ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ProfileScreen.routeName);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
