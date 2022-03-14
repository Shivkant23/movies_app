

import 'package:get/get.dart';
import 'package:random_user/app/modules/movies/models/movies.dart';

class MovieProvider extends GetConnect{
  Future<MoviesObject> getMovies()async{
    final response = await get('https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      // return response.body['results'];
      List<Results>? results = MoviesObject.fromJson(response.body).results;
      return MoviesObject.fromJson(response.body);
    }
  }

  Future<MoviesObject> getTopRatedMovies()async{
    final response = await get('https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      // return response.body['results'];
      List<Results>? results = MoviesObject.fromJson(response.body).results;
      return MoviesObject.fromJson(response.body);
    }
  }
}