import 'package:cred_app/app/data/modal/person.dart';
import 'package:get/get.dart';

mixin ViewVariables {
  RxString name = "".obs;
  RxString email = "".obs;
  RxString mobile = "".obs;
  RxString gender = "".obs;

  late Person person;
}
