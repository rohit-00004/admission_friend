import 'package:flutter/material.dart';


class StateLevel extends StatelessWidget {
  const StateLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8.0),
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
                child: Text('State level seats', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              )),
             
          ],
        ),
        const SizedBox(height: 10,),
        const Divider(height: 10, thickness: 1, color: Colors.black,),

      ],)
    );
  }
}