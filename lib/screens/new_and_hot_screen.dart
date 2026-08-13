import 'package:clone_assignment4/screens/reccommended_screen.dart';
import 'package:flutter/material.dart';
import '../services/tmdb_service.dart';
import '../widgets/media_list_tile.dart';
import '../models/media_item.dart';
import '../constants.dart';

class NewAndHotScreen extends StatefulWidget {
  const NewAndHotScreen({super.key});

  @override
  State<NewAndHotScreen> createState() => NewAndHotScreenState();
} //ReccommendedScreen

class NewAndHotScreenState extends State<NewAndHotScreen> {
  final NewAndHotScreen newHotScreen = NewAndHotScreen();

  List<MediaItem> mediaList = [];
  final Constants constant = Constants();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  Future<void> loadMedia() async {
    setState(() {
      isLoading = true;
    });

    mediaList = await TmdbService().fetchTrending();
    setState(() {});

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: LayoutBuilder(
          builder: ((context, constraints) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: (constraints.maxWidth / 2) - 200,
                ),
                child: Text(
                  "Recommended TV Show & Movies",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );
          }),
        ),
        actions: <Widget>[
          FilledButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
            ),
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReccommendedScreen()),
              );
            },
            child: Text("N"),
          ),
        ],
      ),
      body: (isLoading)
          ? Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 120),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    backgroundColor: const Color.fromARGB(255, 187, 168, 211),
                    color: const Color.fromARGB(255, 128, 170, 236),
                    strokeWidth: 16,
                  ),
                ),
              ),
            )
          : LayoutBuilder(
              builder: ((context, constraints) {
                return ListView.builder(
                  itemCount: mediaList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                        left: constraints.maxWidth / 2 - 246,
                      ),
                      child: MediaListTile(
                        mediaList: mediaList[index],
                        constantUrl: constant,
                      ),
                    );
                  }),
                );
              }),
            ),
    );
  }
}
