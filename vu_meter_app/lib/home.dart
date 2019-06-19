import 'package:flutter/material.dart';

import 'websockets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static WebSocket socket;

  @override
  void initState() {
    super.initState();
    socket = new WebSocket();
  }

  @override
  void dispose() {
    socket.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Controle Leds"),
        ),
        body: Text("Controle Leds"));
  }
}
