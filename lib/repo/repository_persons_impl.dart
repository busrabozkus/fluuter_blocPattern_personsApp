import 'package:dio/dio.dart';
import 'package:persons_app/models/models_persons.dart';
import 'package:persons_app/models/models_persons_result.dart';
import 'package:persons_app/repo/repository_persons.dart';
import 'dart:convert';

class RepositoryPersonImpl extends RepositoryPersons {

  List<Persons> parsePersonsResponse(String response){
    return PersonsResult.fromJson(json.decode(response)).persons;
  }
  @override
  Future<void> addPerson(String personName, String personPhone) async {
    var url="http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var personToAdd={"kisi_ad":personName , "kisi_tel":personPhone};
    var response=await Dio().post(url,data: FormData.fromMap(personToAdd));
    print(response);
  }

  @override
  Future<void> updatePerson(int personId, String personName, String personPhone)async {
    var url="http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var personToUpdate={"kisi_id":personId , "kisi_ad":personName,"kisi_tel":personPhone};
    var response=await Dio().post(url,data: FormData.fromMap(personToUpdate));
    print(response);
  }

  @override
  Future<List<Persons>> personShow() async{
    var url="http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var response=await Dio().get(url);
    print(response);
    return parsePersonsResponse(response.data.toString());

    // TODO: implement personShow
    throw UnimplementedError();
  }

  @override
  Future<List<Persons>> personSearch(String searchWord) async{
    var url="http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var personToCall={"kisi_ad":searchWord};
    var response=await Dio().post(url,data: FormData.fromMap(personToCall));
    print(response);
    return parsePersonsResponse(response.data.toString());
    // TODO: implement personSearch
    throw UnimplementedError();
  }

  @override
  Future<void> deletePerson(int personId)async {
    var url="http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var personToDelete={"kisi_id":personId};
    var response=await Dio().post(url,data: FormData.fromMap(personToDelete));
    print(response);

  }


}
