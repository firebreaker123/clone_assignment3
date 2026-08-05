import 'package:flutter/material.dart';
import '../services/tmdb_service.dart';

class NewAndHotScreen extends StatefulWidget {
  const NewAndHotScreen({super.key});

  @override
  State<NewAndHotScreen> createState() => NewAndHotScreenState();
}

class NewAndHotScreenState extends State<NewAndHotScreen> {
  final NewAndHotScreen newHotScreen = NewAndHotScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(right: 150),
          child: Text(
            "Recommended TV Show & Movies",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}





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
