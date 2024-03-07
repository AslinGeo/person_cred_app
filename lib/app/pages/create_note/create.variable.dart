import 'package:cred_app/app/data/modal/person.dart';
import 'package:cred_app/app/data/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

mixin CreateVariables {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController genderController = TextEditingController();
   Person? person;
  RxBool isNetworkAvailable = false.obs;
  final formKey = GlobalKey<FormState>();
  RxString gender = 'Male'.obs;
  DataPersonProvider dataPersonProvider = DataPersonProvider();
}
