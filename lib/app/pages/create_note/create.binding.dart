import 'package:cred_app/app/pages/create_note/create.controller.dart';
import 'package:get/get.dart';


class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}
