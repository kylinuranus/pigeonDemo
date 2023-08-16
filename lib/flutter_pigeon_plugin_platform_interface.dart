import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_pigeon_plugin_method_channel.dart';

abstract class FlutterPigeonPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterPigeonPluginPlatform.
  FlutterPigeonPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPigeonPluginPlatform _instance = MethodChannelFlutterPigeonPlugin();

  /// The default instance of [FlutterPigeonPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPigeonPlugin].
  static FlutterPigeonPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPigeonPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterPigeonPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
