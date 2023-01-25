import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_app/cubit/cubit_person_add.dart';
import 'package:persons_app/cubit/cubit_person_list_homepage.dart';
import 'package:persons_app/cubit/cubit_person_update.dart';
import 'package:persons_app/screens/screens_my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=>CubitAddPerson()),
        BlocProvider(create: (context)=>CubitUpdatePerson()),
        BlocProvider(create: (context)=>CubitListHomePage()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  ScreensMyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persons"),

      ),
      body: Center(

      ),

    );
  }
}
