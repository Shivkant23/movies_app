

import 'package:get/get.dart';
import 'package:random_user/app/modules/movies/controllers/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<MoviesController>(() => MoviesController());
  }
}