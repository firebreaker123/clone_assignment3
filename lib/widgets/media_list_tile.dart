import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/media_item.dart';
import '../widgets/thumbnail_badge.dart';

class MediaListTile extends StatelessWidget {
  const MediaListTile({
    required this.mediaList,
    required this.constantUrl,
    super.key,
  });

  final MediaItem mediaList;
  final Constants constantUrl;

  double getPaddingLeft() {
    if (mediaList.mediaType == 'tv' && DateTime.now().compareTo(DateTime.parse(mediaList.releaseDate!)) <= 30) {
      return 32;
    }
    else if (mediaList.mediaType == 'tv') {
      return 58;
    }
    else if(DateTime.now().compareTo(DateTime.parse(mediaList.releaseDate!)) <= 30) {
      return 52;
    }
    else {
      return 0;
    }
  }

  String badgeChosen() {
    if (mediaList.mediaType == 'tv' && DateTime.now().compareTo(DateTime.parse(mediaList.releaseDate!)) <= 30) {
      return 'both';
    }
    else if (mediaList.mediaType == 'tv') {
      return mediaList.mediaType!;
    }
    else if(DateTime.now().compareTo(DateTime.parse(mediaList.releaseDate!)) <= 30) {
      return 'recent';
    }
    else {
      return 'none';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${constantUrl.posterImageUrl}${mediaList.posterPath}",
                  height: 80,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 64, left: getPaddingLeft()),
              child: ThumbnailBadge(mediaList: mediaList, constantUrl: constantUrl, badgeType: badgeChosen(),),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: SizedBox(
            width: 260,
            child: Text(
             mediaList.title,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Pressed play icon",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  backgroundColor: const Color.fromARGB(255, 141, 121, 121),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

/* GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            (articleInfo.isBookmarked)
                                ? "Remove from bookmark"
                                : "Add to bookmark",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          backgroundColor: Color.fromARGB(255, 21, 79, 117),
                          duration: Duration(seconds: 1),
                        ) */

/*  ListTile(
      leading: Image.network("${constantUrl.posterImageUrl}$urlTile", height: 100,),
    );*/

    /*  AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: () {
            var cardSnack = SnackBar(
              content: Text(cardDate, style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromARGB(255, 42, 0, 110),
              duration: Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(cardSnack);
          },
          child: Stack(
            children: [
              Image.asset(
                imageFile,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              DateBadge(date: cardDate),
            ],*/