import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/models/state_level.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchInfo extends StatelessWidget {
  final StateLevel scorelist;
  late Map<String, dynamic> mp;
  List<dynamic> todisplay = [];
  final DatabaseHelper db;

  BranchInfo({required this.scorelist, required this.db, super.key}) {
    init();
  }

  void init() {
    mp = scorelist.toJson();
    mp.forEach((key, value) {
      todisplay.add(value);
    });
    // var ls = mp.map((key, value) => )
    mp.remove("branchcode");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: db.getCollegeName(scorelist.branchcode.substring(0,4)),
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(snapshot.data!, 
                style: GoogleFonts.adventPro(
                  fontWeight: FontWeight.w400
                 ),));
            }
            return const CircularProgressIndicator();
        })),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 12, right: 12, bottom: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  DatabaseHelper.getBranchName(scorelist.branchcode),
                  style: GoogleFonts.robotoMono(
                    fontSize: 20,
                    // letterSpacing: 1.5,
                    fontWeight: FontWeight.w600
                  )
                      // const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                ),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 25,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: mp.keys.elementAt(index)[0] == 'G'
                          ? Colors.blue[200]
                          : mp.keys.elementAt(index)[0] == 'L'
                              ? Colors.amber[300]
                              : Colors.purple[300],
                      borderRadius:
                          BorderRadius.circular(30), //border corner radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 3, //spread radius
                          blurRadius: 4, // blur radius
                          offset:
                              const Offset(2, 4), 
                        ),
                        // can set more BoxShadow() here
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(mp.keys.elementAt(index), style: const TextStyle(fontWeight: FontWeight.w600),),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(mp.values.elementAt(index) == 0
                            ? "N/A"
                            : mp.values.elementAt(index).toString(), style: const TextStyle(fontWeight: FontWeight.w600),),
                      ],
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
