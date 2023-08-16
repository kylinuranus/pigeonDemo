#import "FlutterPigeonPlugin.h"
#import "Message.h"

@implementation FlutterPigeonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {

    FlutterPigeonPlugin<FlutterMessage> *api = [[FlutterPigeonPlugin alloc] init];
    FlutterMessageSetup(registrar.messenger, api);
    api.nativeMessage = [[NativeMessage alloc] initWithBinaryMessenger:registrar.messenger];


}


- (NSString *)flutterSendMessageMsg:(F2NMessage *)msg error:(FlutterError * _Nullable __autoreleasing *)error {

    NSLog(@"收到来自于Flutter的消息%@",msg.msg);
    N2FMessage *message = [N2FMessage makeWithMsg2:@"ios返回的消息"];
    //原生向flutter发送消息
    [self.nativeMessage nativeSendMessageMsg:message completion:^(NSString * _Nullable str, FlutterError * _Nullable error) {
        NSLog(@"------%@", str);
    }];
    return @"原生返回成功";
}

//+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
//
//    FlutterMethodChannel* channel = [FlutterMethodChannel
//                                     methodChannelWithName:@"onstar_boost"
//                                     binaryMessenger:[registrar messenger]];
//    FlutterPigeonPlugin* instance = [[FlutterPigeonPlugin
//
//                                      alloc] init];
//    instance.channel = channel;
//    [registrar addMethodCallDelegate:instance channel:channel];
//
//}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"普通通信");
    result(@"1");
}




@end


