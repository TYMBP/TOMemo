//
//  TOMemoViewController.m
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/12.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import "TOMemoViewController.h"
#import "TODb.h"
#import "TOMemo.h"

@interface TOMemoViewController ()
@property (nonatomic, retain) TODb *dbmemos;
@property (nonatomic, retain) NSMutableArray *titles;
@property (nonatomic, retain) NSMutableDictionary *memos;

- (void)addMemo:(id)sender;
- (void)addNewMemo:(TOMemo *)newMemo;

@end

@implementation TOMemoViewController {
  UITableView *tableView;
}

@synthesize  memos, titles;

- (void)viewDidLoad
{
  [super viewDidLoad];

  tableView = [[[UITableView alloc] init] autorelease];
  tableView.frame = CGRectMake(0, 0, 320, 460-50);
  tableView.dataSource = self;
  tableView.delegate = self;
//  [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
  
  memos = [[NSMutableArray alloc] initWithObjects:
           @"a",
           @"b",
           @"c",
           nil];
  
  
  // ナビタイトル
  self.title = NSLocalizedString(@"table",@"");
  // ナビバーカラー
  self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
  // 編集ボタン
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
  // 追加ボタン
  UIBarButtonItem *addButoon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMemo:)];
  self.navigationItem.rightBarButtonItem = addButoon;
  
  [self.view addSubview:tableView];
}

// Viewが破棄される際に発生
- (void)viewDidUnload {
  self.dbmemos = nil;
  self.titles = nil;
  self.memos = nil;
  
  [super viewDidUnload];
}
// メモリ解放
- (void)dealloc {
  self.dbmemos = nil;
  self.titles = nil;
  self.memos = nil;
  
  [super dealloc];
}

// テーブルセクション数取得
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

// テーブル指定セクションの行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.memos.count;
}

// 指定位置のセル取得
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  //NSLog(@"t-yamada: tableveiw methos");
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    NSLog(@"t-yamada: test!");
  }
  
  cell.textLabel.text = [memos objectAtIndex:indexPath.row];
  NSLog(@"t-yamada: %d",indexPath.section);
  return cell;
}

// セル選択時
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// メモ追加ボタン押下
- (void)addMemo:(id)sender {
  NSLog(@"test");
}


// メモの新規追加
- (void)addNewMemo:(TOMemo *)newMemo {
  NSMutableArray *memos = [self.memos objectForKey:newMemo.title];
  if (memos) {
    [memos addObject:newMemo];
  } else {
    memos = [[[NSMutableArray alloc] initWithCapacity:1] autorelease];
    [memos addObject:newMemo];
    [self.memos setObject:memos forKey:newMemo.title];
    [self.titles addObject:newMemo.title];
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
