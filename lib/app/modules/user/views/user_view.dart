import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        title: Text('UserView ${controller.count.value}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                controller.create();
              }, 
              child: Text("连接")
            ),
            ElevatedButton(
              onPressed: (){
                controller.send();
              }, 
              child: Text("发送")
            )
          ],
        )
      ),
    ));
  }
}
