import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pigeon_plugin/flutter_pigeon_plugin.dart';
import 'package:flutter_pigeon_plugin/flutter_pigeon_plugin_platform_interface.dart';
import 'package:flutter_pigeon_plugin/flutter_pigeon_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPigeonPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPigeonPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPigeonPluginPlatform initialPlatform = FlutterPigeonPluginPlatform.instance;

  test('$MethodChannelFlutterPigeonPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPigeonPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterPigeonPlugin flutterPigeonPlugin = FlutterPigeonPlugin();
    MockFlutterPigeonPluginPlatform fakePlatform = MockFlutterPigeonPluginPlatform();
    FlutterPigeonPluginPlatform.instance = fakePlatform;

    // expect(await flutterPigeonPlugin.getPlatformVersion(), '42');
  });
}
