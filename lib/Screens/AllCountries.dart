import 'package:all_country_project/Screens/Country.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/RemoteService.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

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
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                elevation: 5,
                child: Text(posts![index].title),
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        // padding: EdgeInsets.all(10),
        // child: FutureBuilder<List>(
        //   future: countriesResponse,
        //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //           itemBuilder: (BuildContext context, int index) {
        //         return GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).push(
        //               MaterialPageRoute(
        //                 builder: (context) => Country("Canada"),
        //               ),
        //             );
        //           },
        //           child: Card(
        //             elevation: 5,
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   vertical: 10, horizontal: 8),
        //               child: Text(
        //                 'Canada',
        //                 style: TextStyle(fontSize: 18),
        //               ),
        //             ),
        //           ),
        //         );
        //       });
        //     } else {
        //       return Text('Data not obtained');
        //     }
        //   },
        // )
        // ListView(
        //   children: <Widget>[
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => Country("India")),
        //         );
        //       },
        //       child: Card(
        //         elevation: 5,
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             'India',
        //             style: TextStyle(fontSize: 18),
        //           ),
        //         ),
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => Country("Canada")),
        //         );
        //       },
        //       child: Card(
        //         elevation: 5,
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             'Canada',
        //             style: TextStyle(fontSize: 18),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
