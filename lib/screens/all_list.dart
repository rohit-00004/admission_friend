import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/home.dart';
import 'package:admission_friend/screens/details/college_details.dart';
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
      
      
          const Divider(height: 10, thickness: 1, color: Colors.black,),
          const SizedBox(height: 5,),
      
          FutureBuilder<List<dynamic>>(
            future: db.readtable(widget.rank, widget.selections, widget.table),
            builder: ((context, snapshot) {
              
              if(snapshot.hasData){
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
                              table == "home_to_home" ?
                              score = out.gopenh :
                              score = out.gopeno; 
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lopens : 
                              table == "home_to_home" ?
                              score = out.lopenh :
                              score = out.lopeno; 
                            }
                            break;

                          case 'OBC':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gobcs : 
                              table == "home_to_home" ?
                              score = out.gobch :
                              score = out.gobco ; 
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lobcs : 
                              table == "home_to_home" ?
                              score = out.lobch :
                              score = out.lobco; 
                            }
                            break;
                          case 'SC':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gscs : 
                              table == "home_to_home" ?
                              score = out.gsch :
                              score = out.gsco;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lscs : 
                              table == "home_to_home" ?
                              score = out.lsch :
                              score = out.lsco; 
                            }
                            break;
                          case 'VJ':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gvjs : 
                              table == "home_to_home" ?
                              score = out.gvjh :
                              score = out.gvjo; 
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lvjs : 
                              table == "home_to_home" ?
                              score = out.lvjh :
                              score = out.lvjo ;
                            }
                            break;
                          case 'ST':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gsts : 
                              table == "home_to_home" ?
                              score = out.gsth :
                              score = out.gsto; 
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lsts : 
                              table == "home_to_home" ?
                              score = out.lsth :
                              score = out.lsto; 
                            }
                            break;
                          case 'NT1':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gnt1s : 
                              table == "home_to_home" ?
                              score = out.gnt1h :
                              score = out.gnt1o; 
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lnt1s : 
                              table == "home_to_home" ?
                              score = out.lnt1h :
                              score = out.lnt1o ; 
                            }
                            break;
                          case 'NT2':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gnt2s : 
                              table == "home_to_home" ?
                              score = out.gnt2h :
                              score = out.gnt2o;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lnt2s : 
                              table == "home_to_home" ?
                              score = out.lnt2h :
                              score = out.lnt2o ; 
                            }
                            break;

                          case 'NT3':
                            if(selections[0] == 'Male'){
                              table == "state_level" ?
                              score = snapshot.data![index].gnt3s : 
                              table == "home_to_home" ?
                              score = out.gnt3h :
                              score = out.gnt3o ;
                            }
                            else {
                              table == "state_level" ?
                              score = snapshot.data![index].lnt3s : 
                              table == "home_to_home" ?
                              score = out.lnt3h :
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
    );
  }

  TextStyle seattypeStyle() => const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
}