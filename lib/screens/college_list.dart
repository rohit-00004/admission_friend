import 'package:admission_friend/screens/all_list.dart';
import 'package:admission_friend/screens/state_level_list.dart';
import 'package:flutter/material.dart';

import '../database/dbhelper.dart';

class CollegeList extends StatelessWidget {
  final int rank;
  final List<String> selections;

  final DatabaseHelper db;
  CollegeList({required this.rank, required this.selections, required this.db, super.key});

  final pages =  [
    // Icon(Icons.directions_car),
    // StateLevel(rank: rank),
    const Icon(Icons.directions_transit),
    const Icon(Icons.directions_bike),
    const Icon(Icons.directions_boat),
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
          children: [
            // StateLevel(rank: rank, selections: selections, db: db),
            AllLevel(rank: rank, selections: selections, table: 'state_level', db: db),
            AllLevel(rank: rank, selections: selections, table: "home_to_home", db: db,),
            AllLevel(rank: rank, selections: selections, table: "other_to_other", db: db,),
            // const Icon(Icons.directions_transit),
            // const Icon(Icons.directions_bike),
            AllLevel(rank: rank, selections: selections, table: "other_to_home", db: db)
            // const Icon(Icons.directions_boat),
            // HometoHomeList(rank: rank, selections: selections, db: db)
          ]
        ),
        // body: 
      ),
    );
  }
}