import 'package:get/get.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import "../../../utils/socketUser.dart";


class UserController extends GetxController {
  //TODO: Implement UserController

  final count = 0.obs;
  
  WifiInfoWrapper? _wifiObject;
  var IP;
  var socket;

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
    socket.disconnect();
    super.onClose();
  }

  initPlatformState()async{
    WifiInfoWrapper? wifiObject;
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
    }catch(err){
      print("这玩意报错了");
    }
    _wifiObject = wifiObject;
    String ipAddress = _wifiObject != null ? _wifiObject!.ipAddress.toString() : "...";
    print("打印这个IP: ${ipAddress}");
    IP = ipAddress;
  }

  create()async{
    // print(IP);
    socket = SocketClient("192.168.23.106",8888);
    await socket.connect();
  }
  send()async{
    await socket.sendData("hello server");
  }

  void increment() => count.value++;
}
