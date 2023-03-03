import 'package:get/get.dart';

import '../controllers/server_page_controller.dart';

class ServerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServerPageController>(
      () => ServerPageController(),
    );
  }
}
