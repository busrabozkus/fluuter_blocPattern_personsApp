import 'package:persons_app/models/models_persons.dart';

abstract class RepositoryPersons{
  Future<void> addPerson (String personName,String personPhone);
  Future<void> updatePerson(int personId,String personName,String personPhone);
  Future<List<Persons>> personShow();
  Future<List<Persons>> personSearch(String searchWord);
  Future<void> deletePerson(int personId);
}