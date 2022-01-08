import 'package:flutter/material.dart';
import 'package:taala_netkalm/custom_widgets/my_app_bar.dart';
import 'package:taala_netkalm/custom_widgets/my_floating_button.dart';
import 'package:taala_netkalm/screens/tab_screens/all_screen.dart';
import 'package:taala_netkalm/services/firebase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;
  final FirebaseUserDataHandler _handler = FirebaseUserDataHandler();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _handler.getCurrentUserId();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: const MyAppBar(),
      floatingActionButton: const MyFloatingActionButton(),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[350],
              ),
              child: TabBar(

                controller: _tabController,
                isScrollable: false,
                unselectedLabelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                indicatorColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 16,
                ),
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'All',
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: const Text(
                            '21',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Tab(
                    child: Text('Read'),
                  ),
                  const Tab(
                    child: Text('Unread'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AllScreen(),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bike),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
