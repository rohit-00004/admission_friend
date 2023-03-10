import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/home.dart';
import 'package:admission_friend/screens/details/state_level_details.dart';
import 'package:flutter/material.dart';

import '../widgets/simple_list.dart';


class HometoHomeList extends StatefulWidget {
  final int rank;
  final List<String> selections;
  final DatabaseHelper db;
  const HometoHomeList({required this.rank, required this.selections, required this.db, super.key});

  @override
  State<HometoHomeList> createState() => _HometoHomeListState();
}

class _HometoHomeListState extends State<HometoHomeList> {

  late DatabaseHelper db;

  @override
  void initState() {
    db = widget.db;
    // db = DatabaseHelper();  
    // db.insertStatelevel();
    // db.insertcolleges();
    // db.insertHometoHome();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                  decoration: const BoxDecoration(
                    // border: Border.all(width: 2)
                     borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('State level seats', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)),
                  )),
              ),
            ],
          ),
          const SizedBox(height: 5,),
      
          ElevatedButton(onPressed: (){
            db.readhometohome(222, selections);
          }, 
          child: const Text('check db')),
      
          const Divider(height: 10, thickness: 1, color: Colors.black,),
          const SizedBox(height: 5,),
      
          FutureBuilder(
            future: db.readhometohome(widget.rank, widget.selections),
            builder: ((context, snapshot) {
              
              if(snapshot.hasData){
                // setState(() {});
                // print("selections: $selections");
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      separatorBuilder: ((context, index) {
                        return const Divider(thickness: 2,);
                      }),
                      physics: const BouncingScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        // here show for selected category
                        int? score;
                        switch (selections[1]) {
                          case 'OPEN':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gopenh;
                            }
                            else {
                              score = snapshot.data![index].lopenh;
                            }
                            break;
                          case 'OBC':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gobch;
                            }
                            else {
                              score = snapshot.data![index].lobch;
                            }
                            break;
                          case 'SC':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gsch;
                            }
                            else {
                              score = snapshot.data![index].lsch;
                            }
                            break;
                          case 'VJ':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gvjh;
                            }
                            else {
                              score = snapshot.data![index].lvjh;
                            }
                            break;
                          case 'ST':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gsth;
                            }
                            else {
                              score = snapshot.data![index].lsth;
                            }
                            break;
                          case 'NT1':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gnt1h;
                            }
                            else {
                              score = snapshot.data![index].lnt1h;
                            }
                            break;
                          case 'NT2':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gnt2h;
                            }
                            else {
                              score = snapshot.data![index].lnt3h;
                            }
                            break;
                          case 'NT3':
                            if(selections[0] == 'Male'){
                              score = snapshot.data![index].gnt3h;
                            }
                            else {
                              score = snapshot.data![index].lnt3h;
                            }
                            break;

                          default:
                            break;
                        }

                        if(selections[1] == 'EWS'){
                            score = snapshot.data![index].ews;
                        }
                        if(selections[1] == 'TFWS'){
                            score = snapshot.data![index].tfws;
                        }
                        // print("score: $score");
                        return SimpleListTile(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => BranchInfo(scorelist: snapshot.data![index], db: db,)));
                              // print('test');
                            },
                            title: Text(
                              DatabaseHelper.getBranchName(snapshot.data![index].branchcode),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              snapshot.data![index].branchcode,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            leading: 
                            Text(score.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, )),
                            borderRadius: BorderRadius.circular(20),
                            tileColor: Colors.grey[300]!,
                            // Colors.grey[100]!
                            // circleColor: Colors.yellow[100]!,
                            circleDiameter: 80,
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.green],
                            ),
                          );
                      })),
                );
              }
              return const CircularProgressIndicator();
          }))
        
        ],),
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}