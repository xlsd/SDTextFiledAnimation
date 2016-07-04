//
//  ViewController.m
//  账号密码输入框动画
//
//  Created by 薛林 on 16/7/4.
//  Copyright © 2016年 xuelin. All rights reserved.
//

#import "ViewController.h"
#import "XLTextFiledAnimation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    XLTextFiledAnimation *text1 = [[XLTextFiledAnimation alloc]initWithFrame:CGRectMake(80, 200, 300, 80)];
     XLTextFiledAnimation *text2 = [[XLTextFiledAnimation alloc]initWithFrame:CGRectMake(80, 300, 300, 80)];
    
    
    text1.placeHolderLabel.text = @"请输入账号";
    text2.placeHolderLabel.text = @"请输入密码";
    
    text1.animationLine = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.19 green:0.75 blue:0.73 alpha:1.00];
    
    [self.view addSubview:text1];
    [self.view addSubview:text2];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
