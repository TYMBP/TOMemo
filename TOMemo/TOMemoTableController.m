//
//  TOMemoTableController.m
//  TOMemo
//
//  Created by Tomohiko Yamada on 2013/04/10.
//  Copyright (c) 2013年 yamatomo. All rights reserved.
//

#import "TOMemoTableController.h"
#import "TODb.h"
#import "TOMemo.h"

@interface TOMemoTableController ()

@end

@implementation TOMemoTableController {
  @private
  NSMutableArray* _items;
}

- (void)viewDidLoad {
  NSLog(@"viewDidLoad");
  [super viewDidLoad];

  //self.title = @"title";
  _items = [[NSMutableArray alloc] initWithObjects:
            @"test1",
            @"test2",
            @"test3",
            nil];
  
  self.title = NSLocalizedString(@"BOOK_LIST_TITLE", @"");
  
  // 編集ボタン
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
  // 追加ボタン
  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMemo:)];
  self.navigationItem.rightBarButtonItem = addButton;
  [addButton release];

}

- (void)viewDidUnload {
//  self.dbMemo = nil;
//  self.memoIndex = nil;
//  self.memos = nil;
  
  [super viewDidUnload];
}

- (void)dealloc {

//  self.dbMemo = nil;
//  self.memoIndex = nil;
//  self.memos = nil;
  
  [super dealloc];
}

#pragma mark - Table view data source
// テーブルのセクション数を取得
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  //return self.memoIndex.count;
  return [_items count];
}
//// テーブルの指定セクションにおける行数取得
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
////  NSArray *memosByIndex =
//  
//  return 0;
//}
//// セクションタイトル取得
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//  
//}
//
// 指定位置のセルを取得
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//  static NSString *CellIdentifier = @"Cell";
  
//  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  UITableView *cell = [tableView dequeueReusableCellWithIdentifier:@"simple-cell"];
  if (!cell) {
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"simple-cell"] autorelease];
  }
  
  return cell;
  
//  if (cell==nil) {
//    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//  }
//    // Configure the cell...
//    
//    return cell;
}

- (void)tableVIew:(UITableView *)tableView didSelectRowAtIndexpath:(NSIndexPath *)indexPath {
  Class class = NSClassFromString([_items objectAtIndex:indexPath.row]);
  id viewController = [[[class alloc] init ] autorelease];
  if (viewController) {
    [self.navigationController pushViewController:viewController animated:YES];
  }
}
//// セルが選択された時
//- (void)tableview:(UITableView *)tableView didSelectRowIndexpath:(NSIndexPath *)indexPath {
//  
//}
//
//// テーブルの編集を反映させる
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//  
//}
//
//#pragma mark 
//// メモの追加が完了
//- (void)addMemoDidFinish:(TOMemo *)oldMemo newMemo:(TOMemo *)newMemo {
//  
//}
//
//#pragma mark - Private methods
////メモの追加ボタン押下
//- (void)addMemo:(id)sender {
//  
//}
//
////新メモを追加
//- (void)addNewMemo:(TOMemo *)newMemo {
//  
//}
//
//// 指定された位置のメモを取得
//- (void)memoAtIndexPath:(NSIndexPath *)indexPath {
//  
//}
//
//// 指定された位置のメモを削除
//- (void)removeMemo:(NSIndexPath *)indexPath {
//  
//}
//
////　古いメモを削除
//- (void)removeOldMemo:(TOMemo *)oldMemo {
//  
//}
//
@end
