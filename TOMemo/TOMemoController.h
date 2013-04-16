//
//  TOMemoController.h
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/10.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TOMemo;

// memo追加、編集画面が終了を通知するデリゲート
@protocol TOMemoDelegate
- (void)addMemoDidFinish:(TOMemo *)newMemo;
- (void)editMemoDidFinish:(TOMemo *)oldMemo newMemo:(TOMemo *)newMemo;
@end

// 書籍の追加、編集画面を表示
@interface TOMemoController : UIViewController <UITextFieldDelegate> {
  @private
  UILabel      *_titleLabel;
  UITextField  *_titleTextField;
  UILabel      *_memoLabel;
  UITextField  *_memoTextField;
}
@property (nonatomic, assign) id <TOMemoDelegate> delegage; // メモの追加及び編集画面完了のデリゲート
@property (nonatomic, retain) TOMemo *memo;  // 編集対象となるメモ

@end
