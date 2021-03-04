import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie {
  Movie({
    this.search,
  });

  List<Search> search;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        search:
            // I THINK WHAT IMPORTANT HERE IS THE .map() and THE LIST<SEARCH>.FROM
            List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        /* If we put like this ,
        ===>  json["Search"] <=====
       it will say, 
       ==> Exception has occurred.
      _TypeError (type 'List<dynamic>' is not a subtype of type 'List<Search>') <==
     It happens because "search" is a list type varible
      */
      );
}

class Search {
  Search({
    this.imdbId,
    this.title,
    this.year,
    this.poster,
  });

  String imdbId;
  String title;
  String year;
  String poster;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        imdbId: json["imdbID"],
        title: json["Title"],
        year: json["Year"],
        poster: json["Poster"],
      );
}

Future<Movie> fetchMovie() async {
  //try {
  final response = await http
      .get('https://fake-movie-database-api.herokuapp.com/api?s=batman');
  var body = jsonDecode(response.body);
  // var movies = Movie.fromJson(dataMap); DO THIS OR
  //THIS:
  return Movie.fromJson(body);
//====================================
/* Make notice Movie.fromJson()
recive the argumentn "body"
Movie.fromJson will parse "body" to
Movie.fromJson parameter at the Movie
class above
*/
//====================================

  //} catch (e) {
  // print(e);
  //}
  //return null;
}
