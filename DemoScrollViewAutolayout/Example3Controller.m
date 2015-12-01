//
//  Example3Controller.m
//  DemoScrollViewAutolayout
//
//  Created by Ralph Li on 12/1/15.
//  Copyright © 2015 LJC. All rights reserved.
//

#import "Example3Controller.h"
#import <Masonry/Masonry.h>
#import <MMPlaceHolder/MMPlaceHolder.h>

@interface Example3Controller ()

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation Example3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //scrollView
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view).sizeOffset(CGSizeMake(-100,-300));
    }];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.clipsToBounds = NO;
    scrollView.bounces = NO;
    self.scrollView = scrollView;
    
    //subviews
    UIView *v1 = [UIView new];
    v1.backgroundColor = [UIColor blueColor];
    v1.alpha = 0.5;

    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor redColor];
    v2.alpha = 0.5;
    
    [scrollView addSubview:v1];
    [scrollView addSubview:v2];
    
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(scrollView).insets(UIEdgeInsetsMake(10, 10, 0, 10));
        
        make.width.equalTo(scrollView).multipliedBy(1.1);
        make.bottom.equalTo(v2.mas_top).offset(-50);
        make.height.equalTo(@200);
    }];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(scrollView);
        
        make.left.right.equalTo(v1).insets(UIEdgeInsetsMake(0, 50, 0, 50));
        make.height.equalTo(@250);
    }];
    
    
    
    
    
    //frame
    UIView *frame = [UIView new];
    [scrollView addSubview:frame];
    frame.layer.borderColor = [UIColor redColor].CGColor;
    frame.layer.borderWidth = 2.0f;
    [scrollView addSubview:frame];
    
    [frame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(v1).insets(UIEdgeInsetsMake(-10, -10, 0, -10));
        make.bottom.equalTo(v2);
    }];
    
    
    
    UISwitch *sw = [UISwitch new];
    [self.view addSubview:sw];
    [sw addTarget:self action:@selector(actionSwitch) forControlEvents:UIControlEventValueChanged];
}

- (void)actionSwitch
{
    self.scrollView.clipsToBounds = !self.scrollView.clipsToBounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
