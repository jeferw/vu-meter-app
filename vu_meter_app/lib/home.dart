import 'package:flutter/material.dart';
import 'package:vu_meter_app/color-picker/flutter_hsvcolor_picker.dart';

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
    socket.setFunctionListner(onMessege);
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ColorPicker(
            onChanged: (value) => {
                  print(value),
                },
          ),
        ),
      ),
    );
  }

  /*void _pressButton() {
    socket.sendMessege("Olá");
  }*/

  void onMessege(messege) {
    print(messege);
  }
}
