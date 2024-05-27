// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
// import 'package:netflix_clone/models/rated_Tv.dart';
import 'package:netflix_clone/models/tv_series.dart';
import 'package:netflix_clone/models/upcoming_movies.dart';
import 'package:netflix_clone/screens/tvseries.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/carousel.dart';
import 'package:netflix_clone/widgets/movie_card.dart';
import 'package:netflix_clone/widgets/seriescard.dart';
// import 'package:netflix_clone/widgets/videoCard.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovies> upcomingFuture;
  late Future<UpcomingMovies> nowPlayingFuture;
  // late Future<TvSeriesModel> ratedSeries;
  late Future<TvSeries> topRated;
  ApiServices apiServices = ApiServices();
//  late final List<String> videoUrls = [
//   'C:\\Users\\Anirudh\\Desktop\\Coding\\netflix_clone\\assets\\final.mp4',
//   'C:\\Users\\Anirudh\\Desktop\\Coding\\netflix_clone\\assets\\final.mp4',
//   'C:\\Users\\Anirudh\\Desktop\\Coding\\netflix_clone\\assets\\final.mp4',
//   // Add more video URLs as needed
// ];

  @override
  void initState(){
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlayingFuture = apiServices.getNowPlayingMovies();
    topRated = apiServices.getTopRatedSeries();
    // ratedSeries = apiServices.
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Image.asset('assets/logo.png',
        height: 50,
        width: 120,
        ),
        actions: [
          InkWell(
            onTap: () {
               Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const TvSeriesScreen(movieId: 843527,)
                                            ),
                                          );
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15.0
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 27,
              width: 27,
            ),
          ),
          const SizedBox(
            width: 10.0
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(future: topRated, builder: (context, snapshot){
            if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!);
                }else{
                  return const SizedBox.shrink();
                }
                
          
              
          }),
          SizedBox(
            height: 220,
            child: MovieCard(future: upcomingFuture, headLineText: "  UpComing Movies"),
          ),
          SizedBox(
            height: 220,
            child: MovieCard(future: nowPlayingFuture, headLineText: "  Now Playing"),
          ),
          SizedBox(
            height: 220,
            child: TVCard(future: topRated, headLineText: "  Now Playing Series"),
          ),
          SizedBox(
            height: 220,
            child: TVCard(future: topRated, headLineText: "  Upcoming Series"),
          )
        ]),
      )

    );
  }
}