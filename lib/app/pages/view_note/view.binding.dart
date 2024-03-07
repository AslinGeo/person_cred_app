import 'package:cred_app/app/pages/view_note/view.controller.dart';
import 'package:get/get.dart';


class ViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ViewController());
  }
}
