class Persons{
  String person_id;
  String person_name;
  String person_phone;

  Persons({required this.person_id, required this.person_name, required this.person_phone});

  factory Persons.fromJson(Map<String,dynamic> json){
    return Persons(person_id: json["kisi_id"], person_name: json["kisi_ad"], person_phone: json["kisi_tel"]);
  }

}