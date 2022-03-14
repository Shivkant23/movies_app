import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://image.tmdb.org/t/p/original${Get.arguments.backdropPath}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width/ 0.8,
              color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(Get.arguments.title, style: TextStyle(fontSize: 25, color: Colors.white),),
                    const SizedBox(height: 15,),
                    Text(Get.arguments.releaseDate, style: TextStyle(color: Colors.white),),
                    Row(
                      children: <Widget>[
                        Icon(Icons.king_bed, color: Colors.white,),
                        Text(Get.arguments.voteCount.toString(),
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        Icon(Icons.alarm, color: Colors.white,),

                      ],
                    ),
                    Text(Get.arguments.overview, maxLines: 5, overflow: TextOverflow.ellipsis, 
                    style: TextStyle(color: Colors.white),),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}