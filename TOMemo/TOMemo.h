//
//  TOMemo.h
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/10.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOMemo : NSObject

@property (nonatomic, assign) NSInteger    memoId; //!識別子
@property (nonatomic,   copy) NSString     *title; //!タイトル
@property (nonatomic,   copy) NSString  *memoNote; //!メモ
//@property (nonatomic,   copy) NSDate      *update; //!更新日

@end
