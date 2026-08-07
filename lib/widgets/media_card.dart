import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/media_item.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({
    required this.mediaList,
    required this.constantUrl,
    super.key,
  });

  final MediaItem mediaList;
  final Constants constantUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Image.network(
                "${constantUrl.backdropImageUrl}${mediaList.backdropPath}",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Image.asset("../assets/img/netflixLogo.png", height: 25),
            ),
            Padding(
              padding: EdgeInsets.only(left: 190, top: 85),
              child: Icon(
                Icons.play_arrow,
                size: 100,
                color: const Color.fromARGB(158, 255, 255, 255),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 150),
          child: SizedBox(
            width: 270,
            child: Text(
              mediaList.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
