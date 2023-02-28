import 'package:admission_friend/screens/state_level.dart';
import 'package:flutter/material.dart';

class CollegeList extends StatelessWidget {
  const CollegeList({super.key});

  final pages = const [
    // Icon(Icons.directions_car),
    StateLevel(),
    Icon(Icons.directions_transit),
    Icon(Icons.directions_bike),
    Icon(Icons.directions_boat),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Potential colleges' ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: const TabBar(
              indicatorColor: Color.fromARGB(255, 247, 247, 247),
              labelStyle: TextStyle(
                fontSize: 16,
              ),
              tabs: [
                // Tab(icon: Icon(Icons.directions_car)),
                // Tab(icon: Icon(Icons.directions_transit)),
                // Tab(icon: Icon(Icons.directions_bike)),
                Tab(child: Text('1'),),
                Tab(child: Text('2'),),
                Tab(child: Text('3'),),
                Tab(child: Text('4'),),
              ],
            ),
        ),
        body: TabBarView(
          children: pages,
        ),
        // body: 
      ),
    );
  }
}