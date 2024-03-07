import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cred_app/app/constants/snack_bar.dart';
import 'package:cred_app/app/data/provider/provider.dart';
import 'package:cred_app/app/pages/home/home.variable.dart';

import 'package:cred_app/app/pages/view_note/view.controller.dart';
import 'package:cred_app/app/pages/view_note/view.view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController with HomeVariables {
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
    await getPersons();
  }

  getPersons() async {
    if (!isNetworkAvailable.value) {
      return SnackbarUtils().failureSnackbar("No Network Connection");
    }
    var response = await DataPersonProvider().getPersons();

    if (response != null) {
      persons.value = response;
      persons.refresh();
    }
  }

  deletePerson(person) async {
    await DataPersonProvider().deletePerson(person);
    await getPersons();
  }

  viewNavigation(data) {
    Get.put(ViewController());
    Get.to(ViewView(
      person: data,
    ));
  }
}
