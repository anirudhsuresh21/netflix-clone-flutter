import 'package:flutter/material.dart';
import 'package:netflix_clone/models/cast_details.dart';
import 'package:netflix_clone/services/api_services.dart';

class CastInformation extends StatefulWidget {
  final int movieId;

  const CastInformation({super.key, required this.movieId});

  CastInformationState createState() => CastInformationState();
}

class CastInformationState extends State<CastInformation> {
  ApiServices apiServices = ApiServices();
  late Future<CastModel> castDetails;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    castDetails = apiServices.getCastDetails(widget.movieId);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CastModel>(
      future: castDetails,
      builder: (context, castSnapshot) {
        if (castSnapshot.hasData) {
          final castModel = castSnapshot.data!;
          String actorsText = castModel.cast.map((actor) => actor.name).join(', ');

          return Text('Cast: $actorsText',
          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 15),);
        } else {
          return Text('No cast data available');
        }
      },
    );
  }
}
