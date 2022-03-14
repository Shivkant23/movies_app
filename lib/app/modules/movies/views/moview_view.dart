

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user/app/modules/movies/controllers/movie_controller.dart';
import 'package:random_user/app/modules/movies/models/movies.dart';
import 'package:random_user/app/modules/movies/views/movie_screen.dart';

class MoviesView extends GetView<MoviesController>{
  TextEditingController textEditingController = TextEditingController();
  List<Results> filteredListOfMovies = [];
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          focusNode: controller.focusNode,
                          onChanged: controller.productNameSearch,
                          decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              textEditingController.text = "";
                            },
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.all(8),
                          hintText: 'Search',
                          border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            controller.focusNode.hasFocus ? 
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                child: const Text("Cancel"),
                onTap: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ): const SizedBox()
          ],
        )
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: Container(
            child: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  nowPlayingWidget(),
                  nowPlayingWidget(),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    controller.changeTabIndex(controller.tabIndex.value);
  }

  nowPlayingWidget(){
    return controller.obx(
        (data) {
          return ListView.builder(
            itemCount: controller.productList.length,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key('item ${controller.productList[index].title}'),
                onDismissed: (DismissDirection direction) {
                  controller.productList.removeAt(index);
                },
                child: GestureDetector(
                  onTap: (){
                    Get.to(const MovieDetailScreen(), arguments: controller.productList[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.amber : null
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Container(),
                              imageUrl: "https://image.tmdb.org/t/p/original${controller.productList[index].backdropPath}",
                              fit: BoxFit.cover,
                            ),
                           ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    controller.productList[index].originalTitle!,
                                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  controller.productList[index].overview!,
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
        },
        onError: (error) => Center(
          child: Text(error!),
        ),
      );
  }

  buildBottomNavigationMenu(context, MoviesController landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  child: const Icon(
                    Icons.movie_filter_outlined,
                    size: 20.0,
                  ),
                ),
                label: 'Now Playing'
              ),
              BottomNavigationBarItem(
                icon: Container(
                  child: const Icon(
                    Icons.star_border,
                    size: 20.0,
                  ),
                ),
                label: 'Top Rated'
              ),
            ],
          ),
        )));
  }
}