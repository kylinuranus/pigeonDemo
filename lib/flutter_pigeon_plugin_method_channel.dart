import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_pigeon_plugin_platform_interface.dart';

/// An implementation of [FlutterPigeonPluginPlatform] that uses method channels.
class MethodChannelFlutterPigeonPlugin extends FlutterPigeonPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_pigeon_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
