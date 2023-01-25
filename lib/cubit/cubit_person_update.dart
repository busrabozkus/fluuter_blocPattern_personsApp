import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persons_app/repo/repository_persons_impl.dart';

class CubitUpdatePerson extends Cubit<void>{

  CubitUpdatePerson():super(0);
  var personRepository=RepositoryPersonImpl();

  Future<void> updatePerson(int personId, String personName, String personPhone)async {
   await personRepository.updatePerson(personId, personName, personPhone);
    // TODO: implement updatePerson
    throw UnimplementedError();
  }
}