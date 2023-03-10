import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/home.dart';
import 'package:admission_friend/screens/details/state_level_details.dart';
import 'package:flutter/material.dart';

import '../widgets/simple_list.dart';


class AllLevel extends StatefulWidget {
  final int rank;
  final List<String> selections;
  final String table;
  final DatabaseHelper db;
  const AllLevel({required this.rank, required this.selections, required this.table,  required this.db, super.key});

  @override
  State<AllLevel> createState() => _AllLevelState();
}

class _AllLevelState extends State<AllLevel> {

  late DatabaseHelper db;

  @override
  void initState() {
    db = widget.db;
    // db = DatabaseHelper();  
    // db.insertStatelevel();
    // db.insertcolleges();
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: widget.table == "state_level" ?  
                       Text('State level seats', style: seattypeStyle(),) :
                       widget.table == 'home_to_home' ?
                       Text('Home University Seats alloted to Home University Students', style: seattypeStyle(),) : 
                       widget.table == "other_to_other" ?
                       Text('Other than Home University Seats alloted to Other than Home University Students', style: seattypeStyle(),) : 
                       Text('Home University seats alloted to Other than Home University Students', style: seattypeStyle(),),
                       ), 
                  )),
              ),
            ],
          ),
          const SizedBox(height: 5,),
      
          // ElevatedButton(onPressed: (){
          //   // db.insertTxn();
          //   // db.insertcolleges();
          //   db.readtable(90, ['Male', 'Open'], "home_to_home");
          // }, 
          // child: const Text('read table')),
      
          const Divider(height: 10, thickness: 1, color: Colors.black,),
          const SizedBox(height: 5,),
      
          FutureBuilder<List<dynamic>>(
            future: db.readtable(widget.rank, widget.selections, widget.table),
            builder: ((context, snapshot) {
              
              if(snapshot.hasData){
                // setState(() {});
                // print("selections: $selections");
                print("table: ${widget.table}");
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
                        var out = snapshot.data![index];
                        String table = widget.table;
                        int? score;
                        switch (selections[1]) {
                          case 'OPEN':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gopens : 
                              table == "other_to_other" ?
                              score = out.gopeno : 
                              score = out.gopenh;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lopens : 
                              table == "other_to_other" ?
                              score = out.lopeno : 
                              score = out.lopenh;
                            }
                            break;

                          case 'OBC':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gobcs : 
                              table == "other_to_other" ?
                              score = out.gobco : 
                              score = out.gobch;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lobcs : 
                              table == "other_to_other" ?
                              score = out.lobco : 
                              score = out.lobch;
                            }
                            break;
                          case 'SC':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gscs : 
                              table == "other_to_other" ?
                              score = out.gsco : 
                              score = out.gsch;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lscs : 
                              table == "other_to_other" ?
                              score = out.lsco : 
                              score = out.lsch;
                            }
                            break;
                          case 'VJ':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gvjs : 
                              table == "other_to_other" ?
                              score = out.gvjo : 
                              score = out.gvjh;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lvjs : 
                              table == "other_to_other" ?
                              score = out.lvjo : 
                              score = out.lvjh;
                            }
                            break;
                          case 'ST':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gsts : 
                              table == "other_to_other" ?
                              score = out.gsto : 
                              score = out.gsth;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lsts : 
                              table == "other_to_other" ?
                              score = out.lsto : 
                              score = out.lsth;
                            }
                            break;
                          case 'NT1':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gnt1s : 
                              table == "other_to_other" ?
                              score = out.gnt1o : 
                              score = out.gnt1o;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lnt1s : 
                              table == "other_to_other" ?
                              score = out.lnt1o : 
                              score = out.lnt1o;
                            }
                            break;
                          case 'NT2':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gnt2s : 
                              table == "other_to_other" ?
                              score = out.gnt2o : 
                              score = out.gnt2o;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lnt2s : 
                              table == "other_to_other" ?
                              score = out.lnt2o : 
                              score = out.lnt2o;
                            }
                            break;

                          case 'NT3':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gnt3s : 
                              table == "other_to_other" ?
                              score = out.gnt3o : 
                              score = out.gnt3o;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lnt3s : 
                              table == "other_to_other" ?
                              score = out.lnt3o : 
                              score = out.lnt3o;
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BranchInfo(scorelist: snapshot.data![index], db: db,)));
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

  TextStyle seattypeStyle() => const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
}