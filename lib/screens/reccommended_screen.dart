import 'package:flutter/material.dart';
import '../services/tmdb_service.dart';
import '../models/media_item.dart';
import '../constants.dart';
import '../widgets/media_card.dart';

class ReccommendedScreen extends StatefulWidget {
  const ReccommendedScreen({super.key});

  @override
  State<ReccommendedScreen> createState() => ReccommendedScreenState();
} //NewAndHotScreen

class ReccommendedScreenState extends State<ReccommendedScreen> {
  final ReccommendedScreen reccommendedScreen = ReccommendedScreen();
  List<String> netflixTabs = [];
  Map<String, bool> tabs = {};
  String selectedTabs = '';
  List<Icon> tabIconsList = [
    Icon(Icons.upcoming, color: Colors.white, size: 20),
    Icon(
      Icons.local_fire_department,
      color: const Color.fromARGB(255, 228, 41, 8),
      size: 20,
    ),
  ];
  bool isLoading = true;
  final ScrollController scrollController = ScrollController();
  final TmdbService listService = TmdbService();

  List<MediaItem> mediaUpcomingList = [];
  List<MediaItem> mediaTrendingList = [];
  final Constants constant = Constants();

  @override
  initState() {
    super.initState();
    netflixTabs = ['Coming Soon', 'Everyone Watching'];
    tabs = {'Coming Soon': true, 'Everyone Watching': false};
    selectedTabs = 'Coming Soon';
    scrollController.addListener(printScroll);
    loadMedia();
  }

  Future<void> loadMedia() async {
    setState(() {
      isLoading = true;
    });
    mediaUpcomingList = await listService.fetchUpcoming();
    mediaTrendingList = await listService.fetchTrending();

    setState(() {
      isLoading = false;
    });
  }

  void selectTab(String newTab) {
    setState(() {
      tabs[selectedTabs] = false;
      tabs[newTab] = true;
      selectedTabs = newTab;
    });
  }

  Future<void> printScroll() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      scrollController.jumpTo(scrollController.position.minScrollExtent);
      listService.pageNum++;
      mediaUpcomingList = await listService.fetchUpcoming();
      mediaTrendingList = await listService.fetchTrending();
    }
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
              builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: 58,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          top: 15,
                          left: (constraints.maxWidth / 2) - 230,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: netflixTabs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                selectTab(netflixTabs[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 173, 173, 173),
                                  ),
                                  color: (tabs[netflixTabs[index]]!)
                                      ? Color.fromARGB(255, 122, 122, 122)
                                      : Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: tabIconsList[index],
                                      ),
                                      Text(
                                        netflixTabs[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: 800,
                          child: ListView.builder(
                            controller: scrollController,
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth / 2 - 244,
                              top: 10,
                            ),
                            itemCount: (tabs['Coming Soon']!)
                                ? mediaUpcomingList.length
                                : mediaTrendingList.length,
                            itemBuilder: (context, index) {
                              return MediaCard(
                                constantUrl: constant,
                                mediaList: (tabs['Coming Soon']!)
                                    ? mediaUpcomingList[index]
                                    : mediaTrendingList[index],
                                dateBool: tabs['Coming Soon']!,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
