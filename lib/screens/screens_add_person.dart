import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_app/cubit/cubit_person_add.dart';

class ScreensAddPerson extends StatefulWidget {
  const ScreensAddPerson({Key? key}) : super(key: key);

  @override
  State<ScreensAddPerson> createState() => _ScreensAddPersonState();
}

class _ScreensAddPersonState extends State<ScreensAddPerson> {
  var personNameTextField=TextEditingController();
  var personPhoneTextField=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text("Person Add")),
        body:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(controller: personNameTextField,),
                TextField(controller: personPhoneTextField,),
                ElevatedButton(onPressed: onTapAddTask  ,child: Text("Add Person")),

              ],
            )
        )
    );
  }

  void onTapAddTask() {
    context.read<CubitAddPerson>().addPerson(personNameTextField.text, personPhoneTextField.text);
  }
}
