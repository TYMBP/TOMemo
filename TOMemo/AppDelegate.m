//
//  AppDelegate.m
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/09.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import "AppDelegate.h"
#import "TOMemoViewController.h"

@implementation AppDelegate {
  UIWindow *_window;
  UINavigationController *_navigationController;
}
- (void)dealloc
{
  [_window release];
  [_navigationController release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  CGRect bounds = [[UIScreen mainScreen] bounds];
  _window = [[UIWindow alloc] initWithFrame:bounds];
  
  TOMemoViewController *topMemoList = [[[TOMemoViewController alloc] init] autorelease];
  _navigationController = [[UINavigationController alloc] initWithRootViewController:topMemoList];
  [_window addSubview:_navigationController.view];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
