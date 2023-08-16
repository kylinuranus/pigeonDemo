//
//  FlutterPigeonPlugin2.m
//  flutter_pigeon_plugin
//
//  Created by kylin on 2023/8/11.
//

#import "FlutterPigeonPlugin2.h"

@implementation FlutterPigeonPlugin2

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"onstar_boost"
                                     binaryMessenger:[registrar messenger]];
    FlutterPigeonPlugin2* instance = [[FlutterPigeonPlugin2 alloc] init];
    instance.channel = channel;
    [registrar addMethodCallDelegate:instance channel:channel];
    
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"普通通信");
    result(@"1");
}



@end
