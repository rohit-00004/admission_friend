import 'package:admission_friend/screens/college_list.dart';
import 'package:flutter/material.dart';

List<String> selections = ["Male", "OPEN"];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        
      body: Center(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>   CollegeList(rank: int.parse(rankcontroller.text), selections: selections,)));
                }
               },
              child: const Text('Submit'),
            )
            // const SimpleDropDown(),
          ]),
        ),
      ),      
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