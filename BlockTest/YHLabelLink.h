//
//  YHLabelLink.h
//  BlockTest
//
//  Created by yinhan on 15/7/1.
//  Copyright (c) 2015年 yinhan. All rights reserved.
//

/*
 使用方式
 
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
 
 
 [self.view addSubview:lineOne];
 [self.view addSubview:lineTwo];
 [self.view addSubview:lineThr];
 */
#import <UIKit/UIKit.h>

typedef void(^click)(void);
typedef NS_ENUM(NSInteger, UnderLineStyle) {
    displayUnderLineNone = 1,
    displayUnderLineSingle = 2,
    displayUnderLineDot = 3,
    displayUnderLineWaves  = 4,
    displayUnderLineCustom = 5,
};

@interface YHLabelLink : UILabel

@property (nonatomic, assign) UnderLineStyle lineStyle;
@property (nonatomic, retain) NSString  * strCustomStyle;

@property (nonatomic, weak) UIColor * colorForLink;
@property (nonatomic, weak) UIColor * colorForUnderLine;

-(instancetype)initWithFrame:(CGRect)frame;
-(void)allContent:(NSString *)string linkContent:(NSString *)linkContent clickBlock:(void (^)(click))block;

@end
