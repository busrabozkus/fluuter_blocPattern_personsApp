import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_app/models/models_persons.dart';
import 'package:persons_app/repo/repository_persons_impl.dart';

class CubitListHomePage extends Cubit<List<Persons>>{
  CubitListHomePage():super(<Persons>[]);
  var personRepository=RepositoryPersonImpl();

  Future<void> showPerson() async{
    var personList=await personRepository.personShow();
    emit(personList); //Bu Cubiti dinleyen yere bu listeyi aktarmamızı sağlar
  }

  Future<void> personSearch(String searchWord) async{
    var personList=await personRepository.personSearch(searchWord);
    emit(personList);
  }
  Future<void> deletePerson(int personId) async {
    await personRepository.deletePerson(personId);
    await showPerson();

    // TODO: implement deletePerson
    throw UnimplementedError();
  }




}