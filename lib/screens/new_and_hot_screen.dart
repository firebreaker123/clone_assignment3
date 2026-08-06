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
}

class NewAndHotScreenState extends State<NewAndHotScreen> {
  final NewAndHotScreen newHotScreen = NewAndHotScreen();

  List<MediaItem> mediaList = [];
  final Constants constant = Constants();

  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  Future<void> loadMedia() async {
    mediaList = await TmdbService().fetchTrending();
    setState(() {});
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
        title: Padding(
          padding: EdgeInsets.only(right: 150),
          child: Text(
            "Recommended TV Show & Movies",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
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
      body: LayoutBuilder(
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

/* LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 40,
                                left: (constraints.maxWidth / 2) - 213.5,
                              ),*/
/*  AspectRatio(
      aspectRatio: 16 / 9,R
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



/* class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  final TodoViewModel todoViewModel = TodoViewModel();*/





/*class NewAndHotScreen extends StatelessWidget {

   NewAndHotScreen({super.key});

  late final test = TmdbService().fetchTrending();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: test,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text((snapshot.data![index].releaseDate)),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        }),
      ),
    );
  }
} */
