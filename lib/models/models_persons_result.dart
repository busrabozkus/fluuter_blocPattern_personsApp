import 'package:persons_app/models/models_persons.dart';

class PersonsResult{
  List<Persons> persons;
  int success;

  PersonsResult({required this.persons, required this.success});

  factory PersonsResult.fromJson(Map<String,dynamic> json){
    var jsonArray=json["kisiler"] as List;
    List<Persons> persons=jsonArray.map((e) => Persons.fromJson(e)).toList();
    return PersonsResult(persons: persons, success: json["success"] as int);
  }
}