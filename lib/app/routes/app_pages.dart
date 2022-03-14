import 'package:get/get.dart';
import 'package:random_user/app/modules/movies/bindings/movie_binding.dart';
import 'package:random_user/app/modules/movies/views/moview_view.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static const MOVIES_SCREEN = Routes.MOVIES;

  static final routes = [
    GetPage(
      name: Paths.MOVIES,
      page: () => MoviesView(),
      binding: MovieBinding(),
    ),
  ];
}

abstract class Routes {
  static const HOME = Paths.HOME;
  static const MOVIES = Paths.MOVIES;
}

abstract class Paths {
  static const HOME = '/home';
  static const MOVIES = '/movies';
}