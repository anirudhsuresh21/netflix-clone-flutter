import 'package:flutter/material.dart';
// import 'package:netflix_clone/models/cast_details.dart';
import 'package:netflix_clone/models/cast_tv.dart';
import 'package:netflix_clone/services/api_services.dart';

class CastInformationTV extends StatefulWidget {
  final int movieId;

  const CastInformationTV({super.key, required this.movieId});

  CastInformationTVState createState() => CastInformationTVState();
}

class CastInformationTVState extends State<CastInformationTV> {
  ApiServices apiServices = ApiServices();
  late Future<TvSeriesCast> castDetails;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    castDetails = apiServices.getCastDetailstv(widget.movieId);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TvSeriesCast>(
      future: castDetails,
      builder: (context, castSnapshot) {
        if (castSnapshot.hasData) {
          final castModel = castSnapshot.data!;
          String actorsText = castModel.cast.map((actor) => actor.name).join(', ');

          return Text('Cast: $actorsText',
          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),);
        } else {
          return Text('No cast data available');
        }
      },
    );
  }
}
