import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fish_grading_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:get/get.dart';

class GradingDetailController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  FishGrading fishGrading = Get.arguments['fishGrading'];
}
