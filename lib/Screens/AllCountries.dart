import 'package:all_country_project/Screens/Country.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/RemoteService.dart';

class AllCountries extends StatefulWidget {
  AllCountries();

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Countries'),
          backgroundColor: Colors.cyanAccent,
        ),
        body: DisplayData(posts, isLoaded));
  }
}

class DisplayData extends StatelessWidget {
  List<Post>? posts;
  var isLoaded = false;

  DisplayData(this.posts, this.isLoaded);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.isLoaded,
      child: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return Container(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Country(posts![index].title),
                ));
              },
              child: Card(
                elevation: 5,
                child: Text(posts![index].title),
              ),
            ),
          );
        },
      ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
