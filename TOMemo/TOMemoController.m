//
//  TOMemoController.m
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/10.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import "TOMemoController.h"
#import "TOMemo.h"

@interface TOMemoController ()
- (void)checkDone;
- (void)titleTextFieldEditingChanged:(id)sender;
- (void)memoTextFieldEditingChanged:(id)sender;
- (void)cancel:(id)sender;
- (void)done:(id)sender;

@end

@implementation TOMemoController

//@synthesize delegage, memo;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];

  // 完了ボタン
  UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
  self.navigationItem.rightBarButtonItem = doneButton;
  [doneButton release];
  
  _titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)] autorelease];
  _titleLabel.text    = NSLocalizedString(@"BOOK_EDIT_LABEL_TITLE", @"");
  [self.view addSubview:_titleLabel];
  
  _titleTextField = [[[UITextField alloc] initWithFrame:CGRectMake(10, 60, 200, 30)] autorelease];
  _titleTextField.borderStyle = UITextBorderStyleRoundedRect;
  [self.view addSubview:_titleTextField];
  _titleTextField.delegate = self;
  
  _memoLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 30)] autorelease];
  _memoLabel.text = NSLocalizedString(@"BOOK_EDIT_LABEL_MEMO", @"");
  [self.view addSubview:_memoLabel];
  
  _memoTextField = [[[UITextField alloc] initWithFrame:CGRectMake(10, 150, 300, 250)] autorelease];
  _memoTextField.borderStyle = UITextBorderStyleRoundedRect;
  [self.view addSubview:_memoTextField];
  _memoTextField.delegate = self;
  
  [_titleTextField addTarget:self action:@selector(titleTextFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
  
  [_memoTextField addTarget:self action:@selector(titleTextFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
  
  if (self.memo) {
    _titleTextField.text = self.memo.title;
    _memoTextField.text = self.memo.memoNote;
  } else {
    _titleTextField.placeholder = NSLocalizedString(@"BOOK_EDIT_PROMPT_TITLE", @"");
    _memoTextField.placeholder = NSLocalizedString(@"BOOK_EDIT_PROMPT_MEMO", @"");
  
    // キャンセルボタン
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [cancelButton release];
  }
  
  [self checkDone];
}

// Viewが破棄すると発生
- (void)viewDidUnload {
  self.memo = nil;
  
  [_titleLabel      release]; _titleLabel     = nil;
  [_titleTextField  release]; _titleTextField = nil;
  [_memoLabel       release]; _memoLabel      = nil;
  [_memoTextField   release]; _memoTextField  = nil;
  
  [super viewDidUnload];
}

// メモリを解放
- (void)dealloc {
  self.memo = nil;
  
  [_titleLabel      release];
  [_titleTextField  release];
  [_memoLabel       release];
  [_memoTextField   release];
  
  [super dealloc];
}

#pragma mark - UITextFieldDelegate methods

// テキストフィールドでリターン押下時に発生
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

#pragma mark - Private methods

// 著者テキストフィールドで編集が完了時に発生
- (void)memoTextFieldEditingChanged:(id)sender {
  [self checkDone];
}

// 題名テキストフィールドで編集が完了した時に発生
- (void)titleTextFieldEditingChanged:(id)sender {
  [self checkDone];
}

// 編集を完了できることをチェック
- (void)checkDone {
  self.navigationItem.rightBarButtonItem.enabled = (_titleTextField.text.length > 0 && _memoTextField.text.length > 0);
}

// キャンセルボタンが押された時に発生
- (void)cancel:(id)sender {
  [self.delegage addMemoDidFinish:nil];
}

// 完了ボタン押下時に発生
- (void)done:(id)sender {
  TOMemo *newMemo = [[[TOMemo alloc] init] autorelease];
  newMemo.memoId = self.memo.memoId;
  newMemo.title  = _titleTextField.text;
  newMemo.memoNote   = _memoTextField.text;
  
  if (self.memo) {
    [self.delegage editMemoDidFinish:self.memo newMemo:newMemo];
  } else {
    [self.delegage addMemoDidFinish:newMemo];
  }
}



@end
