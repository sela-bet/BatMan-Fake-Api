import 'package:flutter/material.dart';
import 'network.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movie;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
        future: fetchMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.search.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    height: 400,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 100,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 90,
                            backgroundImage: NetworkImage(
                                snapshot.data.search[index].poster),
                          ),
                        ),
                        Text(
                          snapshot.data.search[index].title,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          snapshot.data.search[index].year,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
