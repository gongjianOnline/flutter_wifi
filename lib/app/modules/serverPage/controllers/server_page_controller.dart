import 'package:get/get.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import "../../../utils/socketServer.dart";

class ServerPageController extends GetxController {
  //TODO: Implement ServerPageController

  RxInt count = 0.obs;
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
  void onClose() async {
    await socket.closeSocket();
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

  // 创建server
  serverButton()async{
    await initPlatformState();
    socket = SocketServer(IP,8888);
    await socket.startServer();
  }

  // 发送信息
  send(){
    socket.send();
  }






}
