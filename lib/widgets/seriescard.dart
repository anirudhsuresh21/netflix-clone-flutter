import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tv_series.dart';
import 'package:netflix_clone/screens/tvseries.dart';

class TVCard extends StatelessWidget {
  final Future<TvSeries> future;
  final String headLineText;
  const TVCard(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(headLineText,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                      child: ListView.builder(
                          // padding: const EdgeInsets.all(10),
                          itemCount: data?.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                               onTap: () {
                        // Add your navigation logic here
                        // For example:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TvSeriesScreen(
                              movieId: data![index].id,
                            ),
                          ),
                        );
                      },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(
                                  "$imageUrl${data?[index].posterPath}",
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text('Error loading image');
                                  },
                                
                                ),
                              ),
                            );
                          })),
                ]);
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
