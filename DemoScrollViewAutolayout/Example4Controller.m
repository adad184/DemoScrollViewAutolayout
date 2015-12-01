//
//  Example3Controller.m
//  DemoScrollViewAutolayout
//
//  Created by Ralph Li on 12/1/15.
//  Copyright © 2015 LJC. All rights reserved.
//

#import "Example4Controller.h"
#import <Masonry/Masonry.h>
#import <MMPlaceHolder/MMPlaceHolder.h>

@interface Example4Controller ()

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation Example4Controller

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
    
    UIView *v3 = [UIView new];
    v3.backgroundColor = [UIColor yellowColor];
    v3.alpha = 0.5;
    
    UIView *v4 = [UIView new];
    v4.backgroundColor = [UIColor greenColor];
    v4.alpha = 0.5;
    
    [scrollView addSubview:v1];
    [scrollView addSubview:v2];
    [scrollView addSubview:v3];
    [scrollView addSubview:v4];
    
    CGSize size = CGSizeMake(200, 200);
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(scrollView.mas_top);
        
        make.size.mas_equalTo(size);
    }];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(scrollView.mas_left);
        
        make.size.mas_equalTo(size);
        make.right.equalTo(v1.mas_left);
        make.top.equalTo(v1.mas_bottom);
    }];
    
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(scrollView.mas_right);
        
        make.size.mas_equalTo(size);
        make.left.equalTo(v1.mas_right);
        make.top.equalTo(v1.mas_bottom);
    }];
    
    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(scrollView.mas_bottom);
        
        make.size.mas_equalTo(size);
        make.left.equalTo(v1.mas_left);
        make.top.equalTo(v2.mas_bottom);
    }];
    
    
    
    //frame
    UIView *frame = [UIView new];
    [scrollView addSubview:frame];
    frame.layer.borderColor = [UIColor redColor].CGColor;
    frame.layer.borderWidth = 2.0f;
    [scrollView addSubview:frame];
    
    [frame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(v1.mas_centerY);
        make.left.equalTo(v2.mas_centerX);
        make.right.equalTo(v3.mas_centerX);
        make.bottom.equalTo(v4.mas_centerY);
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
