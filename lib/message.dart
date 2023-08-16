// Autogenerated from Pigeon (v10.1.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class F2NMessage {
  F2NMessage({
    this.msg,
  });

  String? msg;

  Object encode() {
    return <Object?>[
      msg,
    ];
  }

  static F2NMessage decode(Object result) {
    result as List<Object?>;
    return F2NMessage(
      msg: result[0] as String?,
    );
  }
}

class N2FMessage {
  N2FMessage({
    this.msg2,
  });

  String? msg2;

  Object encode() {
    return <Object?>[
      msg2,
    ];
  }

  static N2FMessage decode(Object result) {
    result as List<Object?>;
    return N2FMessage(
      msg2: result[0] as String?,
    );
  }
}

class _FlutterMessageCodec extends StandardMessageCodec {
  const _FlutterMessageCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is F2NMessage) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return F2NMessage.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class FlutterMessage {
  /// Constructor for [FlutterMessage].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FlutterMessage({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _FlutterMessageCodec();

  Future<String> flutterSendMessage(F2NMessage arg_msg) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.flutter_pigeon_plugin.FlutterMessage.flutterSendMessage', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_msg]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as String?)!;
    }
  }
}

class _NativeMessageCodec extends StandardMessageCodec {
  const _NativeMessageCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is N2FMessage) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return N2FMessage.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class NativeMessage {
  static const MessageCodec<Object?> codec = _NativeMessageCodec();

  String nativeSendMessage(N2FMessage msg);

  static void setup(NativeMessage? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.flutter_pigeon_plugin.NativeMessage.nativeSendMessage', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.flutter_pigeon_plugin.NativeMessage.nativeSendMessage was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final N2FMessage? arg_msg = (args[0] as N2FMessage?);
          assert(arg_msg != null,
              'Argument for dev.flutter.pigeon.flutter_pigeon_plugin.NativeMessage.nativeSendMessage was null, expected non-null N2FMessage.');
          final String output = api.nativeSendMessage(arg_msg!);
          return output;
        });
      }
    }
  }
}