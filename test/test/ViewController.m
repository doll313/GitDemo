//
//  ViewController.m
//  test
//
//  Created by MengWang on 15-5-11.
//  Copyright (c) 2015年 YukiWang. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
#import "WMDragView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"腹部锻炼打卡 第100天";
    [self.view addSubview:label];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 20;
    
    // gcd
    
    
    
    
    
    
    // pinch 捏合手势
    WMDragView *myView = [[WMDragView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
    [self.view addSubview:myView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)click:(id)sender {
    PushViewController *ctrl = [[PushViewController alloc] init];
    [self presentViewController:ctrl animated:YES completion:nil];
}

@end
