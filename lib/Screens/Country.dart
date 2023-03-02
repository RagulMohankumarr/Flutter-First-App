import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final String screen_title;

  Country(this.screen_title);

  @override
  Widget build(BuildContext context) {
    var titles = ["Ragul", "Krish", "Sindhu", "Surya"];
    final titleDetails = <String>[
      "Ragul's Lobby",
      "Krish's Lobby",
      "Sindhu's Lobby",
      "Surya's Lobby"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(this.screen_title),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            CountryCardDetail("Ragul", "Ragul's Lobby"),
            CountryCardDetail("Krish", "Krish's Lobby"),
            CountryCardDetail("Sindhu", "Sindhu's Lobby"),
            CountryCardDetail("Surya", "Surya's Lobby"),
          ],
        ),
      ),
    );
  }
}

// class CountryDetailCard extends StatelessWidget {
//   final String title;
//
//   CountryDetailCard(this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.orange,
//       elevation: 15,
//       child: Center(
//         child: Text(
//           title,
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class CountryCardDetail extends StatelessWidget {
  final String title, titleDetail;

  CountryCardDetail(this.title, this.titleDetail);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Card(
        elevation: 10,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      back: Card(
        color: Colors.orange,
        elevation: 15,
        child: Center(
          child: Text(
            titleDetail,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

// class CountryCard extends StatelessWidget {
//   final String title;
//
//   const CountryCard(this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 10,
//       child: Center(
//         child: Text(
//           title,
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
