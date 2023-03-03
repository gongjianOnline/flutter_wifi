import "dart:io";

class SocketServer {
  int _port;
  String IP;

  SocketServer(this.IP, this._port);

  late ServerSocket _serverSocketObj;

  void startServer() async {
    try {
      _serverSocketObj = await ServerSocket.bind(IP, _port);
      print('Server started on port $_port');
      print('Server Socket created successfully!');
      _serverSocketObj.listen((socket) {
        socket.write('Hello, user');
        socket.listen((data) {
          final message = String.fromCharCodes(data).trim();
          print('Received message: ${message}');
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // 发送
  void send(){
    // _socketObj.write('Hello, Socket Client!');
    print("做个摆设吧");
  }

  // 监听关闭
  void closeSocket() {
    // 需要线关闭监听的_serverSocketObj
    if (_serverSocketObj != null) {
      _serverSocketObj.close();
      print('Server Socket closed');
    }
  }
}
