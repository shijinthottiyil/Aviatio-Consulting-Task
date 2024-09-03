import 'package:aviato_consulting_task/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class DI implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
