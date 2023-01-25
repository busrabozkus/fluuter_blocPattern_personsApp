import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/repository_persons_impl.dart';

class CubitAddPerson extends Cubit<void>{

  CubitAddPerson():super(0);  //super varsayılan değer

  var personRepository=RepositoryPersonImpl();
  Future<void> addPerson(String personName, String personPhone) async {
    await personRepository.addPerson(personName, personPhone);
    // TODO: implement addPerson
    throw UnimplementedError();
  }
}