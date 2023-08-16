// Autogenerated from Pigeon (v10.1.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "Message.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}
static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface F2NMessage ()
+ (F2NMessage *)fromList:(NSArray *)list;
+ (nullable F2NMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface N2FMessage ()
+ (N2FMessage *)fromList:(NSArray *)list;
+ (nullable N2FMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation F2NMessage
+ (instancetype)makeWithMsg:(nullable NSString *)msg {
  F2NMessage* pigeonResult = [[F2NMessage alloc] init];
  pigeonResult.msg = msg;
  return pigeonResult;
}
+ (F2NMessage *)fromList:(NSArray *)list {
  F2NMessage *pigeonResult = [[F2NMessage alloc] init];
  pigeonResult.msg = GetNullableObjectAtIndex(list, 0);
  return pigeonResult;
}
+ (nullable F2NMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [F2NMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.msg ?: [NSNull null]),
  ];
}
@end

@implementation N2FMessage
+ (instancetype)makeWithMsg2:(nullable NSString *)msg2 {
  N2FMessage* pigeonResult = [[N2FMessage alloc] init];
  pigeonResult.msg2 = msg2;
  return pigeonResult;
}
+ (N2FMessage *)fromList:(NSArray *)list {
  N2FMessage *pigeonResult = [[N2FMessage alloc] init];
  pigeonResult.msg2 = GetNullableObjectAtIndex(list, 0);
  return pigeonResult;
}
+ (nullable N2FMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [N2FMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.msg2 ?: [NSNull null]),
  ];
}
@end

@interface FlutterMessageCodecReader : FlutterStandardReader
@end
@implementation FlutterMessageCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [F2NMessage fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FlutterMessageCodecWriter : FlutterStandardWriter
@end
@implementation FlutterMessageCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[F2NMessage class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FlutterMessageCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FlutterMessageCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FlutterMessageCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FlutterMessageCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FlutterMessageGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FlutterMessageCodecReaderWriter *readerWriter = [[FlutterMessageCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void FlutterMessageSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FlutterMessage> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.flutter_pigeon_plugin.FlutterMessage.flutterSendMessage"
        binaryMessenger:binaryMessenger
        codec:FlutterMessageGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(flutterSendMessageMsg:error:)], @"FlutterMessage api (%@) doesn't respond to @selector(flutterSendMessageMsg:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        F2NMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        NSString *output = [api flutterSendMessageMsg:arg_msg error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface NativeMessageCodecReader : FlutterStandardReader
@end
@implementation NativeMessageCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [N2FMessage fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface NativeMessageCodecWriter : FlutterStandardWriter
@end
@implementation NativeMessageCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[N2FMessage class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface NativeMessageCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation NativeMessageCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[NativeMessageCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[NativeMessageCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *NativeMessageGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    NativeMessageCodecReaderWriter *readerWriter = [[NativeMessageCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

@interface NativeMessage ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation NativeMessage

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}
- (void)nativeSendMessageMsg:(N2FMessage *)arg_msg completion:(void (^)(NSString *_Nullable, FlutterError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.flutter_pigeon_plugin.NativeMessage.nativeSendMessage"
      binaryMessenger:self.binaryMessenger
      codec:NativeMessageGetCodec()];
  [channel sendMessage:@[arg_msg ?: [NSNull null]] reply:^(id reply) {
    NSString *output = reply;
    completion(output, nil);
  }];
}
@end
