import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/media_item.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({
    required this.mediaList,
    required this.constantUrl,
    required this.dateBool,
    super.key,
  });

  final MediaItem mediaList;
  final Constants constantUrl;
  final bool dateBool;

  String getMonth(int monthNum) {
    return switch (monthNum) {
      1 => 'January',
      2 => "February",
      3 => 'March',
      4 => 'April',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => "August",
      9 => "September",
      10 => "October",
      11 => "November",
      12 => "December",
      _ => "Never released",
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "${constantUrl.backdropImageUrl}${mediaList.backdropPath}",
                ),
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
          padding: EdgeInsets.only(right: 190),
          child: SizedBox(
            width: 270,
            child: Text(
              mediaList.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        (dateBool)
            ? Padding(
                padding: EdgeInsets.only(right: 410),
                child: Text(
                  "${getMonth(DateTime.parse(mediaList.releaseDate).month)} ${DateTime.parse(mediaList.releaseDate).day}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            : SizedBox(height: 0, width: 0),
        
      ],
    );
  }
}
