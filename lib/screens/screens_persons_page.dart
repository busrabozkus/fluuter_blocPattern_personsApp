import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_app/cubit/cubit_person_update.dart';
import 'package:persons_app/models/models_persons.dart';

class ScreensDetailPerson extends StatefulWidget {
  Persons person;
  ScreensDetailPerson({required this.person});

  @override
  State<ScreensDetailPerson> createState() => _ScreensDetailPersonState();
}

class _ScreensDetailPersonState extends State<ScreensDetailPerson> {
  var personNameTextField=TextEditingController();
  var personPhoneTextField=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var person=widget.person;
    personPhoneTextField.text=person.person_name;
    personNameTextField.text=person.person_phone;
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text("Persons Details")),
        body:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(controller: personNameTextField,),
                TextField(controller: personPhoneTextField,),
                ElevatedButton(onPressed: onTapUpdateButton  ,child: Text("Update Person")),

              ],
            )
        )
    );
  }

  void onTapUpdateButton() {
    context.read<CubitUpdatePerson>().updatePerson(int.parse(widget.person.person_id),personNameTextField.text, personPhoneTextField.text);
  }
}

