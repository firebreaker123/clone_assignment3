import 'package:flutter/material.dart';
import '../services/tmdb_service.dart';
import '../widgets/media_list_tile.dart';
import '../models/media_item.dart';
import '../constants.dart';

class ReccommendedScreen extends StatefulWidget {
  const ReccommendedScreen({super.key});

  @override
  State<ReccommendedScreen> createState() => ReccommendedScreenState();
}

class ReccommendedScreenState extends State<ReccommendedScreen> {
  final ReccommendedScreen reccommendedScreen = ReccommendedScreen();

  List<MediaItem> mediaList = [];
  final Constants constant = Constants();

  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  Future<void> loadMedia() async {
    mediaList = await TmdbService().fetchUpcoming();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: Text(
                "New & Hot",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 9, left: 120),
              child: Icon(Icons.cast, color: Colors.white, size: 33),
            ),
            Padding(
              padding: EdgeInsets.only(top: 9, left: 25),
              child: Icon(Icons.download, color: Colors.white, size: 33),
            ),
            Padding(
              padding: EdgeInsets.only(top: 9, left: 20),
              child: Icon(Icons.search, color: Colors.white, size: 33),
            ),
          ],
        ),
        actions: <Widget>[
          FilledButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("N"),
          ),
        ],
      ),
      body: Column(children: [

        ],
      ),
    );
  }
}
