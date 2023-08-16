#import <Flutter/Flutter.h>
#import "Message.h"

@interface FlutterPigeonPlugin : NSObject<FlutterPlugin,FlutterMessage>

@property (nonatomic, strong) NativeMessage *nativeMessage;
@property(nonatomic, strong) FlutterMethodChannel* channel;


@end
