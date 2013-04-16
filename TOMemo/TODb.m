//
//  TODb.m
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/10.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import "TODb.h"
#import "TOMemo.h"

@implementation TODb

- (id)init {
  self = [super init];
  if (self) {
    
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}

// 書籍を追加します。
- (TODb *)add:(TODb *)memo {
  
  return memo;
}

- (NSArray *)memos {
 
  NSMutableArray *memoList = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
  
  TOMemo *memo = [[TOMemo alloc]init];
  int x = 1;
  memo.memoId = x;
  memo.title = @"tAuthor";
  memo.memoNote = @"testtest";
  
  [memoList addObject:memo];
  NSLog(@"object memoList:%@",memoList);
  
  
  return memoList;
}


@end
