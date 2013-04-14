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

//@synthesize  existMemos, titles;

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // データ取得
  self.dbmemos = [[[TODb alloc] init] autorelease];
  self.titles = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
  self.memos = [[[NSMutableDictionary alloc] initWithCapacity:0] autorelease];
  
  NSArray *existMemos = [self.dbmemos memos];
  
  NSLog(@"viewDidLoad _existMemos:%@",existMemos);
 
  for (TOMemo *memo in existMemos) {
    [self addNewMemo:memo];
  }
  
//  self.titles = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
//  for (id i in [_existMemos keyEnumerator]) {
//    NSLog(@"t-yamada:existMemos.. %@",i);
//  }
    
  tableView = [[[UITableView alloc] init] autorelease];
  tableView.frame = CGRectMake(0, 0, 320, 460-50);
  tableView.dataSource = self;
  tableView.delegate = self;
  
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
  self.memos= nil;
  
  [super dealloc];
}

// テーブルセクション数取得
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  NSLog(@"numberOfSectionsInTableView section: %d",self.titles.count);
  return self.titles.count;
}

// テーブル指定セクションの行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSArray *memoByTitle = [self.memos objectForKey:[self.titles objectAtIndex:section]];
  NSLog(@"numberOfRowInSection:%d",memoByTitle.count);
  return memoByTitle.count;
}

// セクション名の取得
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  NSLog(@"titleForHeaderInSection:%@",[self.titles objectAtIndex:section]);
  return [self.titles objectAtIndex:section];
}

// 指定位置のセル取得
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
  
  TOMemo *memo = [self memoAtIndexPath:indexPath];
  cell.textLabel.text = memo.title;
  NSLog(@"cellForRowAtIndexPath : %@",cell.textLabel.text);
  return cell;
}

// セル選択時
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// メモ追加ボタン押下
- (void)addMemo:(id)sender {
  NSLog(@"push test");
}


// メモの新規追加
- (void)addNewMemo:(TOMemo *)newMemo {
  NSLog(@"newMemo:%@",newMemo.title);
  NSMutableArray *memoByTitle = [self.memos objectForKey:newMemo.title];

  if (memoByTitle) {
    [memoByTitle addObject:newMemo];
  } else {
    memoByTitle = [[[NSMutableArray alloc] initWithCapacity:1] autorelease];
    [memoByTitle addObject:newMemo];
    [self.memos setObject:memoByTitle forKey:newMemo.title];
    [self.titles addObject:newMemo.title];
    NSLog(@"memos:%@",self.memos);
    NSLog(@"titles:%@",self.titles);
  }
}

// 指定された位置のメモを取得
- (TOMemo *)memoAtIndexPath:(NSIndexPath *)indexPath {
  NSArray *memoData = [self.memos objectForKey:[self.titles objectAtIndex:indexPath.section]];
  NSLog(@"memoAtIndexPath:%@",[memoData objectAtIndex:indexPath.row]);
  return [memoData objectAtIndex:indexPath.row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
