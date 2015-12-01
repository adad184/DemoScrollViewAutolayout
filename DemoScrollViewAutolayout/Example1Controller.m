//
//  Example1Controller.m
//  DemoScrollViewAutolayout
//
//  Created by Ralph Li on 12/1/15.
//  Copyright © 2015 LJC. All rights reserved.
//

#import "Example1Controller.h"
#import <Masonry/Masonry.h>
#import <MMPlaceHolder/MMPlaceHolder.h>

@interface Example1Controller ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation Example1Controller

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
    [scrollView addSubview:v1];
    
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
        make.height.equalTo(scrollView).multipliedBy(1.5);
    }];
    
    
    //frame
    UIView *frame = [UIView new];
    [scrollView addSubview:frame];
    frame.layer.borderColor = [UIColor redColor].CGColor;
    frame.layer.borderWidth = 2.0f;
    [scrollView addSubview:frame];
    
    [frame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v1);
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
