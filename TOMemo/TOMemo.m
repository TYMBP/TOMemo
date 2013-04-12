//
//  TOMemo.m
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/10.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import "TOMemo.h"

@implementation TOMemo

@synthesize title,memoId;

- (void)dealloc {
  self.title = nil;
  //self.update = nil;
  //self.memoId = nil;
  [super dealloc];
}

@end
