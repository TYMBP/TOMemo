//
//  TOMemo.h
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/10.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOMemo : NSObject

@property (nonatomic, assign) NSInteger    bookId; //!識別子
@property (nonatomic,   copy) NSString*    author; //!著者
@property (nonatomic,   copy) NSString*     title; //!題名
@property (nonatomic,   copy) NSDate*   copyright; //!好評年月日

@end
