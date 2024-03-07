import 'dart:convert';

import 'package:cred_app/app/constants/snack_bar.dart';
import 'package:cred_app/app/data/dao/person.dao.dart';
import 'package:cred_app/app/data/modal/person.dart';
import 'package:http/http.dart' as http;

class DataPersonProvider {
  static const apiUrl =
      "https://crudcrud.com/api/563d18bf6bd14fe48fb49d05496278d9/person";
  final PersonDao _personDao = PersonDao.instance;

  createPerson(Person person) async {
    try {
      Map<String, String> header = {};
      header["Content-Type"] = "application/json; charset=UTF-8";
      await http.post(Uri.parse(apiUrl),
          body: jsonEncode(person.toJson()), headers: header);

      await getPersons();
    } catch (e) {
      SnackbarUtils().failureSnackbar(e.toString());
    }
  }

  getPersons() async {
    List persons = [];
    try {
      var response = await http.get(Uri.parse(apiUrl));
      var responseBody = jsonDecode(response.body);
      persons = responseBody.map((data) => Person.fromJson(data)).toList();
      persons.map((e) => _personDao.insertOrUpdate(e.uid, e)).toList();

      return persons;
    } catch (e) {
      SnackbarUtils().failureSnackbar(e.toString());
      return null;
    }
  }

  updatePerson(Person person) async {
    try {
      Map<String, String> header = {};
      header["Content-Type"] = "application/json; charset=UTF-8";
      await http.put(Uri.parse("$apiUrl/${person.uid}"),
          headers: header, body: jsonEncode(person.toJson()));
      _personDao.insertOrUpdate(person.uid, person);
    } catch (e) {
      SnackbarUtils().failureSnackbar(e.toString());
      return null;
    }
  }

  deletePerson(Person person) async {
    try {
      Map<String, String> header = {};
      header["Content-Type"] = "application/json; charset=UTF-8";
      await http.delete(Uri.parse("$apiUrl/${person.uid}"), headers: header);
      _personDao.delete(person.uid!);
    } catch (e) {
      SnackbarUtils().failureSnackbar(e.toString());
      return null;
    }
  }
}
