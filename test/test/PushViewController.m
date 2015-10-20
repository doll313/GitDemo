//
//  PushViewController.m
//  test
//
//  Created by MengWang on 15/8/1.
//  Copyright (c) 2015年 YukiWang. All rights reserved.
//

#import "PushViewController.h"
#import "ScrollViewTest.h"

@interface PushViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat pre;
@property (nonatomic, strong) UIScrollView *headerView;
@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *t = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    
    ScrollViewTest *scrollView = [[ScrollViewTest alloc] initWithFrame:CGRectMake(80, 0, self.view.bounds.size.width, 50)];
    scrollView.contentSize = CGSizeMake(600, 50);
    scrollView.backgroundColor = [UIColor yellowColor];
    [scrollView setBounces:NO];
    [scrollView setScrollEnabled:YES];
    scrollView.delegate = self;
    scrollView.tag = 5000;
    
    [t addSubview:scrollView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, scrollView.bounds.size.width, 50)];
    label.text = @"header";
    label.textColor = [UIColor blackColor];
    [scrollView addSubview:label];
    
    self.headerView = scrollView;
    return t;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        ScrollViewTest *scrollView = [[ScrollViewTest alloc] initWithFrame:CGRectMake(80, 0, self.view.bounds.size.width, 50)];
        scrollView.contentSize = CGSizeMake(600, 50);
        scrollView.backgroundColor = [UIColor yellowColor];
        [scrollView setBounces:NO];
        [scrollView setScrollEnabled:YES];
        scrollView.delegate = self;
        scrollView.tag = 5000;

        [cell.contentView addSubview:scrollView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, scrollView.bounds.size.width, 50)];
        label.text = @"测试测试测试";
        label.textColor = [UIColor blackColor];
        [scrollView addSubview:label];
    }
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y != self.pre) {
        self.pre = scrollView.contentOffset.y;
        return;
    }
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        ScrollViewTest *sc = (ScrollViewTest *)[cell viewWithTag:5000];
        sc.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
        self.headerView.contentOffset = sc.contentOffset;
        
        self.pre = scrollView.contentOffset.y;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
