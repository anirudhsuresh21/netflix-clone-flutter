import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tvModel.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/castDetTv.dart';

class TvSeriesScreen extends StatefulWidget {
  final int movieId;
  const TvSeriesScreen({super.key, required this.movieId});

  @override
  TvSeriesScreenState createState() => TvSeriesScreenState();
}

class TvSeriesScreenState extends State<TvSeriesScreen>
    with SingleTickerProviderStateMixin {
  ApiServices apiServices = ApiServices();
  late TabController _tabController;

  // late Future<MovieDetailModel> movieDetail;
  // late Future<MovieRecommendationsModel> movieRecommendationModel;
  // late Future<CastModel> castDetails;
  // late Future<UpcomingMovies> nowPlayingFuture;
  late Future<TvModel> tvDetails;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
    // _tabController = TabController(length: 2, vsync: this);
  }

  fetchInitialData() {
    // print(tvDetails);
    setState(() {
      tvDetails = apiServices.getTvDetails(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchInitialData();
    var size = MediaQuery.of(context).size;
    print(widget.movieId);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: (tvDetails),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data;
              print('Details');
              print(snapshot.data);
              String genresText =
                  movie!.genres.map((genre) => genre.name).join(',');
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "$imageUrl${movie.posterPath}"),
                                fit: BoxFit.cover)),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              movie.firstAirDate.year.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              genresText,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          movie.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CastInformationTV(movieId: widget.movieId)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FutureBuilder(
                    future: tvDetails,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        int tabControllerLength =
                            snapshot.data!.numberOfSeasons;
                        print(tabControllerLength);
                        _tabController = TabController(
                            length: tabControllerLength, vsync: this);
                        return DefaultTabController(
                          length: tabControllerLength,
                          child: Column(
                            children: [
                              TabBar(
                                isScrollable: true,
                                // indicatorSize: TabBarIndicatorSize.label,
                                controller: _tabController,
                                tabs: List.generate(
                                  tabControllerLength,
                                  (index) {
                                    return Tab(
                                    
                                      text: 'Season ${index + 1}',
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    for (int seasonIndex = 1;
                                        seasonIndex <= tabControllerLength;
                                        seasonIndex++)
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            for (int episodeIndex = 1;
                                                episodeIndex <=
                                                    snapshot
                                                        .data!
                                                        .seasons[seasonIndex]
                                                        .episodeCount;
                                                episodeIndex++)
                                              Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: Image.asset(
                                                  "./assets/white.jpeg",
                                                  // Replace with the path to your Netflix logo image
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        ); // Show a loading indicator while waiting for data
                      }
                    },
                  ),
                ],
              );
            }
            return const Center(child: Text('No Data'),);
          },
        ),
      ),
    );
  }

// int _tabControllerLength() {
//   if (tvDetails == null || tvDetails.connectionState != ConnectionState.done) {
//     // If tvDetails is not yet available or still loading, return a default length
//     return 2;
//   } else {
//     // If tvDetails is available, return the number of seasons
//     return tvDetails.data!.seasons.length;
//   }
// }
}
