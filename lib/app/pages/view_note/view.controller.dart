import 'package:cred_app/app/pages/create_note/create.controller.dart';
import 'package:cred_app/app/pages/create_note/create.view.dart';
import 'package:cred_app/app/pages/view_note/view.variable.dart';
import 'package:get/get.dart';

class ViewController extends GetxController with ViewVariables {
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
    name.value = person.name;
    email.value = person.email;
    mobile.value = person.mobileNumber;
    gender.value = person.gender;
  }

  editNavigation() {
    Get.put(CreateController());
    Get.to(CreateView(
      person: person,
    ));
  }
}
