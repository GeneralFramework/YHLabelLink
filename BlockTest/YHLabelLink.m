//
//  YHLabelLink.m
//  BlockTest
//
//  Created by yinhan on 15/7/1.
//  Copyright (c) 2015年 yinhan. All rights reserved.
//

#import "YHLabelLink.h"

static NSString * const STR_UNDER_LINE_SINGLE   = @"______________________________________";
static NSString * const STR_UNDER_LINE_DOT      = @"﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍";
static NSString * const STR_UNDER_LINE_WAVE     = @"﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏";

@interface YHLabelLink ()
{
    UIButton * button;
    click clickBtn;
}
@end

@implementation YHLabelLink

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.lineBreakMode = NSLineBreakByClipping;
        [button setTitle:STR_UNDER_LINE_SINGLE forState:UIControlStateNormal];
        [self addSubview:button];
        self.userInteractionEnabled = YES;
        
        _colorForLink = [UIColor blueColor];
        _colorForUnderLine = [UIColor blueColor];
    }
    return self;
}


-(NSString *)strCustomStyle{
    [button setTitle:_strCustomStyle forState:UIControlStateNormal];
    return _strCustomStyle;
}

-(void)allContent:(NSString *)string linkContent:(NSString *)linkContent clickBlock:(void (^)(click))block{

    clickBtn = [block copy];
    
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    NSMutableAttributedString * attribuLink = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange rangeValue = [string rangeOfString:linkContent];
    [attribuLink addAttribute:NSForegroundColorAttributeName value:self.colorForLink range:rangeValue];
    
    self.attributedText = attribuLink;
    
    CGSize strSubSizeLink = [linkContent boundingRectWithSize:CGSizeMake(320, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;

    switch (self.lineStyle) {
            
        case displayUnderLineNone:{
            [button setTitle:@"" forState:UIControlStateNormal];
        } break;
            
        case displayUnderLineSingle:{
            [button setTitle:STR_UNDER_LINE_SINGLE forState:UIControlStateNormal];
        }break;
            
        case displayUnderLineDot:{
            [button setTitle:STR_UNDER_LINE_DOT forState:UIControlStateNormal];
        }break;
        
        case displayUnderLineWaves:{
            [button setTitle:STR_UNDER_LINE_WAVE forState:UIControlStateNormal];
        }break;
        case displayUnderLineCustom:{
            [button setTitle:self.strCustomStyle forState:UIControlStateNormal];
        }
        default:
            break;
    }
    NSString * frist = [string substringToIndex:1];
    CGRect rect = [frist boundingRectWithSize:CGSizeMake(320, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    int width = (rect.size.width * rangeValue.location);
    button.frame = CGRectMake(width,
                                  1,
                                  strSubSizeLink.width,
                                  self.frame.size.height);
    [button setTitleColor:_colorForUnderLine forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickServerLink:) forControlEvents:UIControlEventTouchUpInside];

    
}

-(void)clickServerLink:(UIButton *)btn{

    clickBtn();
}

@end
