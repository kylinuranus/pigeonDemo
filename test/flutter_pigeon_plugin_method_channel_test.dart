import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pigeon_plugin/flutter_pigeon_plugin_method_channel.dart';

void main() {
  MethodChannelFlutterPigeonPlugin platform = MethodChannelFlutterPigeonPlugin();
  const MethodChannel channel = MethodChannel('flutter_pigeon_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
