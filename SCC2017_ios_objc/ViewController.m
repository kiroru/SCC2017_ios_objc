//
//  ViewController.m
//  SCC2017_ios_objc
//
//  Created by sak on 2017/06/26.
//  Copyright © 2017年 Kiroru Inc. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface Item : NSObject
@property (nonatomic, strong) NSString* imageUrl;
@property (nonatomic, strong) NSString* jname;
@property (nonatomic, strong) NSString* ename;
- (instancetype)initWithImageUrl:(NSString*)imageUrl
                           jname:(NSString*)jname
                           ename:(NSString*)ename;
@end

@implementation Item
static NSString* BASE_URL = @"https://kiroru-inc.jp/share/scc2017/";
- (instancetype)initWithImageUrl:(NSString *)imageUrl
                           jname:(NSString *)jname
                           ename:(NSString *)ename
{
    self = [super init];
    if (self) {
        self.imageUrl =
            [NSString stringWithFormat:@"%@%@", BASE_URL, imageUrl];
        self.jname = jname;
        self.ename = ename;
    }
    return self;
}
@end

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray* items;
@property (nonatomic, weak) IBOutlet UITableView* tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _items = [@[] mutableCopy];
    [_items addObject:[[Item alloc] initWithImageUrl:@"Japan.png"
                                               jname:@"日本"
                                               ename:@"Japan"]];
    [_items addObject:[[Item alloc] initWithImageUrl:@"China.png"
                                               jname:@"中国"
                                               ename:@"China"]];
    [_items addObject:[[Item alloc] initWithImageUrl:@"USA.png"
                                               jname:@"アメリカ"
                                               ename:@"America"]];
    [_items addObject:[[Item alloc] initWithImageUrl:@"England.png"
                                               jname:@"イギリス"
                                               ename:@"England"]];
    [_items addObject:[[Item alloc] initWithImageUrl:@"France.png"
                                               jname:@"フランス"
                                               ename:@"France"]];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    Item* item = _items[indexPath.row];
    
    UIImageView* iv = [cell viewWithTag:1];
    [iv sd_setImageWithURL:[NSURL URLWithString:item.imageUrl]];
    
    UILabel* tv1 = [cell viewWithTag:2];
    tv1.text = item.jname;
    
    UILabel* tv2 = [cell viewWithTag:3];
    tv2.text = item.ename;
    
    return cell;
}

- (CGFloat)     tableView:(UITableView *)tableView
  heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

@end
