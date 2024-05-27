import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String videoUrl;

  const VideoCard({Key? key, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(videoUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.play_circle_filled,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}