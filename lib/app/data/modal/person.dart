import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject {
  Person(
      {required this.name,
      required this.email,
      required this.mobileNumber,
      required this.gender,
      this.uid});
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String mobileNumber;
  @HiveField(3)
  String gender;
  @HiveField(4)
  String? uid;

  factory Person.fromJson(Map<dynamic, dynamic> json) => Person(
      name: json["name"],
      email: json["email"],
      mobileNumber: json["mobileNumber"],
      gender: json["gender"],
      uid: json["_id"]);

  toJson() => {
        "name": name,
        "email": email,
        "mobileNumber": mobileNumber,
        "gender": gender,
      };
}
