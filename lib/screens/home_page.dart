import 'package:bootcamp__app/photos_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> _photosData = [];

  Future<void> fetchPhotos() async {
    final _dioinstance = Dio();

    _dioinstance.options.headers['Authorization'] =
        "Client-ID YJjcuc5QOz9RJCeu73m9Ie7YxOTKDmVztIP-5aJyTX4";

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
    fetchPhotos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchPhotos();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              color: Colors.deepOrange,
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
    ));
  }
}
