import 'package:get/get.dart';
import 'package:jagsa/src/controllers/loginview_controller.dart';

class LoginViewBinding extends Bindings {
  @override
  void dependencies() {
    /// controller
    Get.put(LoginViewController(steamRepository: Get.find()));
  }
}
