import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:genderize/screens/result.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController ctr = TextEditingController();
  final _frmKey = GlobalKey<FormState>();
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Genderize')),
      body: Column(
        children: [
          Form(
            key: _frmKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: ctr,
                    decoration: const InputDecoration(
                      labelText: "Enter Name",
                      border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (value){
                      name = value.toString();
                      if (kDebugMode) {
                        print(name);
                      }
                      ctr.clear();
                    },
                  ),
                ),
                ElevatedButton(onPressed: (){
                  FormState frmState = _frmKey.currentState!;
                  if(_frmKey.currentState!.validate()){
                    frmState.save();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Result(name: name!)));
                  }
                }, child: const Text("Submit"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
