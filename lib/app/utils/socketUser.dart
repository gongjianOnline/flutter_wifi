import 'dart:io';

class SocketClient {
  final String IP; // 热点IP地址
  final int port; // 端口号

  SocketClient(this.IP,this.port);

  late Socket _socket;

  Future<void> connect() async {
    try {
      _socket = await Socket.connect(IP, port);
      print('Connected to server: $IP:$port');
      _socket.listen((data) {
        final message = String.fromCharCodes(data).trim();
        print('Received message: $message');
      }).onDone(() {
        print("监听到服务端断了");
        _socket.close();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> sendData(String data) async {
    try {
      _socket.write(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> disconnect() async {
    try {
      await _socket.close();
    } catch (e) {
      print(e.toString());
    }
  }
}
