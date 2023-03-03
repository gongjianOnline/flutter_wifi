import 'dart:io';

import 'package:get/get.dart';

class SocketServerController extends GetxController {

  late ServerSocket serverSocket;
  late Socket? socketParams = null;
  RxInt count = 0.obs; 

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  createSocket(IP,_port)async{
    try {
      serverSocket = await ServerSocket.bind(IP, _port);
      print("socket服务器创建成功");
      serverSocket.listen(handelSocket);
    } catch (e) {
      print(e.toString());
    }
  }

  // 监听socket
  handelSocket(Socket  socket){
    print("xxxx");
    socketParams = socket;
    socket.write('Hello, user');
    socket.listen((data) {
      final message = String.fromCharCodes(data).trim();
      print('Received message: ${message}');
    }).onDone(() {
      print("服务断开");
      closeSocket();
    });
  }

  // 发送
  void send()async{
    if(socketParams != null){
      socketParams?.write('Hello, Socket Client!');
    }else{
      print("socketParams尚未初始化");
    }
  }

  // 监听关闭
  void closeSocket() {
    // 需要线关闭监听的_serverSocketObj
    if (serverSocket != null) {
      serverSocket.close();
      print('Server Socket closed');
    }
  }



}
