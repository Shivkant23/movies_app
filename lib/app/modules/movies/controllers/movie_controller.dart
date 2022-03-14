import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_user/app/modules/movies/models/movies.dart';
import 'package:random_user/app/modules/movies/movie_provider/movie_provider.dart';
class MoviesController extends GetxController with StateMixin<MoviesObject> {
  var tabIndex = 0.obs;
  var isFocused = false.obs;
  final FocusNode focusNode = FocusNode();


  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
  List<Results> productList = <Results>[].obs;
  List<Results> productTempList = <Results>[].obs;

  productNameSearch(String name) {
    if (name.isEmpty) {
      productList = productTempList;
    } else {
      productList = productTempList
          .where((element) =>
              element.title!.toLowerCase().contains(name.toLowerCase()))
          .toList();
          print(productList);
          update();
    }
  }

  deleteTheItem(int index) {
    productList.removeAt(index);
    print(productList);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener((){isFocused=true.obs; });

    MovieProvider().getMovies().then((resp) {
      productList = productTempList = resp.results!;
      change(resp, status: RxStatus.success());
    }, onError: (err) {

      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });

    ever(tabIndex,(callback) {
      if(tabIndex == 0){
        MovieProvider().getMovies().then((resp) {
          productList = productTempList = resp.results!;
          change(resp, status: RxStatus.success());
        }, onError: (err) {
          change(
            null,
            status: RxStatus.error(err.toString()),
          );
        });
      }else{
        MovieProvider().getTopRatedMovies().then((resp) {
          productList = productTempList = resp.results!;
          change(resp, status: RxStatus.success());
        }, onError: (err) {
          change(
            null,
            status: RxStatus.error(err.toString()),
          );
        });
      }
    });

    

    

  }

}
