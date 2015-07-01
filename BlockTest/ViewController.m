//
//  ViewController.m
//  BlockTest
//
//  Created by yinhan on 15/6/30.
//  Copyright (c) 2015年 yinhan. All rights reserved.
//

#import "ViewController.h"
#import "YHLabelLink.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    YHLabelLink * lineOne = [[YHLabelLink alloc] initWithFrame:CGRectMake(20, 40, 200, 20)];
    [lineOne allContent:@"拨打热线1234567890" linkContent:@"123" clickBlock:^(click block) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击123" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
    }];
    
    
    //链接颜色和字体颜色
    YHLabelLink * lineTwo = [[YHLabelLink alloc] initWithFrame:CGRectMake(20, 60, 200, 20)];
    lineTwo.colorForLink = [UIColor grayColor];
    lineTwo.colorForUnderLine = [UIColor redColor];
    [lineTwo allContent:@"点击《hello》" linkContent:@"《hello》" clickBlock:^(click block) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击hello" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
    }];
    
    
    
    //下划线不同
    YHLabelLink * lineThr = [[YHLabelLink alloc] initWithFrame:CGRectMake(20, 80, 200, 20)];
    lineThr.lineStyle = displayUnderLineDot;
    [lineThr allContent:@"我是另一个下划线" linkContent:@"下划线" clickBlock:^(click block) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"下划线" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
    }];
    
    
    YHLabelLink * lineFour = [[YHLabelLink alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    lineFour.lineStyle = displayUnderLineWaves;
    [lineFour allContent:@"我是波浪线" linkContent:@"波浪线" clickBlock:^(click block) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"波浪线" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
    }];
    
    YHLabelLink * lineFive = [[YHLabelLink alloc] initWithFrame:CGRectMake(20, 120, 200, 20)];
    lineFive.lineStyle = displayUnderLineCustom;
    lineFive.strCustomStyle = @"======================";
    lineFive.colorForLink = [UIColor grayColor];
    [lineFive allContent:@"我是自定义线" linkContent:@"自定义线" clickBlock:^(click block) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"自定义线" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
    }];
    
    
    
    [self.view addSubview:lineOne];
    [self.view addSubview:lineTwo];
    [self.view addSubview:lineThr];
    [self.view addSubview:lineFour];
    [self.view addSubview:lineFive];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
