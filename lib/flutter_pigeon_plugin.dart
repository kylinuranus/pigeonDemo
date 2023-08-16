
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'flutter_pigeon_plugin_platform_interface.dart';
import 'package:flutter_pigeon_plugin/message.dart';

class FlutterPigeonPlugin extends NativeMessage {

  static final FlutterMessage _flutterMessage = FlutterMessage();

  factory FlutterPigeonPlugin() => _getInstance();

  static FlutterPigeonPlugin get instance => _getInstance();

  static FlutterPigeonPlugin? _instance = null;

  static FlutterPigeonPlugin _getInstance() {
    _instance ??= FlutterPigeonPlugin._internal();
    NativeMessage.setup(_instance);
    return _instance!;
  }

  FlutterPigeonPlugin._internal();


  // Future<String?> getPlatformVersion() {
  //   return FlutterPigeonPluginPlatform.instance.getPlatformVersion();
  // }

  void sendMessage() async {
    F2NMessage message = F2NMessage();
    message.msg = "这是一条从Flutter发往Native的消息";
    print("---flutter开始发消息${DateTime.now().toString()}");
    String s = await _flutterMessage.flutterSendMessage(message);
    print("---flutter收到消息${DateTime.now().toString()}");
    print("-----zsk$s");
  }

  @override
  String nativeSendMessage(N2FMessage msg) {
    print("收到了Native发来的消息：${msg.msg2}");
    return "1111";
  }

  // void sendMessage2() async {
  //   print("---flutter2开始发消息${DateTime.now().toString()}");
  //   var res = await MethodChannel("onstar_boost").invokeMethod("test","");
  //   print("---flutter2收到消息${DateTime.now().toString()}");
  //
  // }


}
