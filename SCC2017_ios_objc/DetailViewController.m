//
//  DetailViewController.m
//  SCC2017_ios_objc
//
//  Created by sak on 2017/06/30.
//  Copyright © 2017年 Kiroru Inc. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailViewController ()
@property (nonatomic, weak) IBOutlet UIImageView* iv;
@property (nonatomic, weak) IBOutlet UILabel* tv1;
@property (nonatomic, weak) IBOutlet UILabel* tv2;
- (IBAction)close:(id)sender;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_iv sd_setImageWithURL:[NSURL URLWithString:_imageUrl]];
    _tv1.text = _jname;
    _tv2.text = _ename;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)close:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
