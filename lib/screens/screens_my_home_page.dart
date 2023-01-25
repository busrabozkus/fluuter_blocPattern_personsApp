import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_app/cubit/cubit_person_list_homepage.dart';
import 'package:persons_app/models/models_persons.dart';
import 'package:persons_app/screens/screens_add_person.dart';
import 'package:persons_app/screens/screens_persons_page.dart';


class ScreensMyHomePage extends StatefulWidget {
  const ScreensMyHomePage({Key? key}) : super(key: key);

  @override
  State<ScreensMyHomePage> createState() => _ScreensMyHomePageState();
}

class _ScreensMyHomePageState extends State<ScreensMyHomePage> {
  bool search=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CubitListHomePage>().showPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:search ? TextField(decoration: const InputDecoration(hintText: "Search"),
        onChanged: (value){
        context.read<CubitListHomePage>().personSearch(value);
      },) :const Text("Persons"),
        actions: [
          search ? IconButton(onPressed: (){
    setState(() {
    search=false;
    });
    }, icon: Icon(Icons.cancel)) :
    IconButton(onPressed: (){
    setState(() {
    search=true;
    });
    context.read<CubitListHomePage>().showPerson();

    }, icon: Icon(Icons.search))
  
        ],

      ),
      body:BlocBuilder<CubitListHomePage , List<Persons>>(
          builder: (context,personList){
            if(personList.isNotEmpty){
              return ListView.builder(
                itemCount: personList.length,
                  itemBuilder: (context,index){
                  var person=personList[index];
                  return GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreensDetailPerson(person: person))).then((value) =>{
                        context.read<CubitListHomePage>().showPerson()
                    });
                    },
                    child: Card(
                      child:Row(
                        children: [
                          Text("${person.person_name} - ${person.person_phone}"),
                          Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${person.person_name} silinsin mi"),
                            action: SnackBarAction(
                              label:"Yes",
                              onPressed:() {
                                context.read<CubitListHomePage>().deletePerson(int.parse(person.person_id));
                              }
                            ),));
                          }, icon: Icon(Icons.delete))
                        ],
                      )
                    ),
                  );
                  });
            }
            else{
              return Center(
              );
            }

          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreensAddPerson())).then((value) =>{
    context.read<CubitListHomePage>().showPerson()

    });
  }


}