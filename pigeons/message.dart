import 'package:pigeon/pigeon.dart';

class F2NMessage{
  String? msg;
}

class N2FMessage{
  String? msg2;
}

//flutter 通信原生
@HostApi()
abstract class FlutterMessage{
  String flutterSendMessage(F2NMessage msg);
}

//原生 通信flutter
@FlutterApi()
abstract class NativeMessage{
  String nativeSendMessage(N2FMessage msg);
}