import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/screens/college_list.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

List<String> selections = ["Male", "OPEN"];

class HomePage extends StatefulWidget {

  final DatabaseHelper db;
  const HomePage({required this.db, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final List<String> _gender = ['Male', 'Female'];
  final List<String> _category = ['OPEN', 'OBC', 'SC', 'VJ', 'ST', 'NT1', 'NT2', 'NTT3', 'EWS', 'TFWS'];
  TextEditingController rankcontroller = TextEditingController();

  @override
  void dispose() {
    rankcontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Admission friend' ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),

      drawer: SafeArea(
        child: Drawer(
          width: MediaQuery.of(context).size.width * .7,
          backgroundColor: Theme.of(context).primaryColor,
          child: DrawerHeader(
            child: Column(

              children: [
                drawerField(const Icon(Icons.person, color: Colors.white,), 'My Profile'),

                // const Divider(thickness: .8, color: Colors.white,),
                InkWell(
                  onTap: (){},
                  child: drawerField(const Icon(Icons.picture_as_pdf_outlined, color: Colors.white,), 'Cutoff for 2021-22')),
                const Divider(thickness: .8, color: Colors.white,),
                drawerField(null, 'Round I'),
                drawerField(null, 'Round II'),
                drawerField(null, 'Round III'),

                // const Divider(thickness: .8, color: Colors.white,),
                InkWell(
                  onTap: (){},
                  child: drawerField(const Icon(Icons.picture_as_pdf_outlined, color: Colors.white,), 'Cutoff for 2020-21')),
                const Divider(thickness: .8, color: Colors.white,),
                drawerField(null, 'Round I'),
                drawerField(null, 'Round II'),
                drawerField(null, 'Round III'),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children:  [
              SizedBox(height: size.height*.03,),
              Container(
                width: size.width*.5,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(8)),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      controller: rankcontroller,
                      validator: (value) {
                        if(int.tryParse(value!) == null){
                          return "Enter a valid rank";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'rank',
                      ),
                    ),
                  ),
              ),
              SizedBox(height: size.height*.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: size.width*.3,
                    child: DropdownSelection(options: _gender, selected: 'Male'),
                  ),
                  SizedBox(
                    width: size.width*.3,
                    child: DropdownSelection(options: _category, selected: 'OPEN'),
                  ),
                ],
              ),
              SizedBox(height: size.height*.1),
              OutlinedButton(
                // style: outlineButtonStyle,
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.green
                  ),
                ),  
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>   CollegeList(rank: int.parse(rankcontroller.text), selections: selections, db: widget.db,)));
                  }
                 },
                child: const Text('Submit'),
              ),
              Container(
                height: 300,
                child: Image.asset('assets/images/students_09.jpg', fit: BoxFit.fitWidth)),
              // const SimpleDropDown(),
            ]),
          ),
        ),
      ),      
    );
  }

  ListTile drawerField(Icon? icon, String text) {
    return ListTile(
                leading: icon,
                title: Text(text, style: const TextStyle(color: Colors.white),),
              );
  }
}

class DropdownSelection extends StatefulWidget {
  final List<String> options;
  final String selected;
  const DropdownSelection({required this.options, required this.selected, super.key});

  @override
  State<DropdownSelection> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DropdownSelection> {

  late List<String> options;
  late String selected;
  late int idx;

  @override
  void initState() {
    options = widget.options;
    selected = widget.selected;

    if(selected == "Male"){
      idx = 0;
    }
    else {idx = 1;}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            value: selected,
            isDense: true,
            onChanged: (String? newValue) {
              setState(() {
                selected = newValue!;
                selections[idx] = selected;
                // state.didChange(newValue);
              });
            },
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}