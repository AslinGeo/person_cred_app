import 'package:get/get.dart';

mixin HomeVariables {
  RxList persons = [].obs;
  RxMap selectNote = {}.obs;
  RxBool isNetworkAvailable = false.obs;
}
