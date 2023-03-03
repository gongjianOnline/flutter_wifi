import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/server_page_controller.dart';

class ServerPageView extends GetView<ServerPageController> {
  const ServerPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        title: Text("${controller.count.value}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                controller.serverButton();
              }, 
              child: Text("建立连接")
            ),
            ElevatedButton(
              onPressed: (){
                controller.send();
              }, 
              child: Text("发送消息")
            ),

          ],
        )
      ),
    ));
  }
}
