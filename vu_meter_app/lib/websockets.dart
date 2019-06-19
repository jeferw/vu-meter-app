import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket {
  static const String _SERVER_ADDRESS = "ws://192.168.1.45:34263";
  static WebSocketChannel _channel;
  static Function _onMessege;

  WebSocket() {
    _channel = IOWebSocketChannel.connect(_SERVER_ADDRESS);
    _channel.stream.listen(_onReceptionOfMessageFromServer);
  }

  sendMessege(String message) {
    if (_channel != null && _channel.sink != null) _channel.sink.add(message);
  }

  _onReceptionOfMessageFromServer(message) {
    if (_onMessege != null) _onMessege(message);
  }

  setFunctionListner(Function callback) {
    _onMessege = callback;
  }

  close() {
    _channel.sink.close();
  }
}
