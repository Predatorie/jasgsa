import 'package:get/get.dart';
import 'package:jagsa/src/controllers/loginview_controller.dart';

class LoginViewBinding extends Bindings {
  @override
  void dependencies() {
    /// controller
    Get.lazyPut(() => LoginViewController(steamRepository: Get.find()));
  }
}
