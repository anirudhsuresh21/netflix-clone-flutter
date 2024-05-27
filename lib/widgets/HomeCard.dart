import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/upcoming_movies.dart';

class MovieCard extends StatelessWidget {
  final Future<UpcomingMovies> future;
  final String headLineText;
  const MovieCard({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder: (context,snapshot){
          var data = snapshot.data?.results;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headLineText,
                style: const TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView.builder(
                    // padding: const EdgeInsets.all(10),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network("$imageUrl${data?[index].posterPath}"),
                  );
                    
                  }
                )),]
          
          );
        });
  }
}