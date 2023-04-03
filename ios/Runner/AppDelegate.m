#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"samples.chenhang/navigation" binaryMessenger:(FlutterViewController *)self.window.rootViewController];
      [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      NSLog(@"method channel: %@, arguments: %@", call.method, call.arguments);
          if ([@"openAppMarket" isEqualToString:call.method]) {
              NSDictionary *params = call.arguments;
              NSString *appid = params[@"appid"];
              NSString* iTunesLink;
              if([[[UIDevice currentDevice] systemVersion] floatValue] >= 11) {
                  iTunesLink = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/xy/app/foo/id%@", appid];
              } else {
                  iTunesLink = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", appid];
              }

              [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
              result(@0);

          } else {
              result(FlutterMethodNotImplemented);
          }

      }];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
