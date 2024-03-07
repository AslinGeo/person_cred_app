import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cred_app/app/constants/snack_bar.dart';
import 'package:cred_app/app/data/modal/person.dart';
import 'package:cred_app/app/pages/create_note/create.variable.dart';
import 'package:cred_app/app/pages/home/home.controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateController extends GetxController with CreateVariables {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    super.dispose();
  }

  init() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      isNetworkAvailable.value = false;
    } else {
      isNetworkAvailable.value = true;
    }
  }

  updateOrCreatePerson() async {
    if (!isNetworkAvailable.value) {
      Get.back();
      return SnackbarUtils.instance.failureSnackbar("No Network Connection");
    } else {
      Person _person = Person(
          name: nameController.text,
          email: emailController.text,
          mobileNumber: mobileController.text,
          gender: gender.value,
          uid: person != null ? person!.uid : "");
      if (person != null) {
        await dataPersonProvider.updatePerson(_person);
      } else {
        await dataPersonProvider.createPerson(_person);
      }

      Get.back();
      Get.back();
      nameController.text = "";
      mobileController.text = "";
      emailController.text = "";
    }

    // Get.put(HomeController());
    // Get.find<HomeController>().getPersons();
  }
}
