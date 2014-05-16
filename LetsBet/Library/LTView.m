//
//  LTView.m
//  LTView
//
//  Created by lanou3g on 14-4-11.
//  Copyright (c) 2014年 Chaiyahang. All rights reserved.
//

#import "LTView.h"

@implementation LTView
@synthesize delegate=_delegate;

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame labelText:nil text:nil placeholder:nil spacing:0];
}

//指定初始化方法的实现
-(id)initWithFrame:(CGRect)frame labelText:(NSString *)labelText text:(NSString *)text placeholder:(NSString *)placeholder spacing:(CGFloat)spacing
{
    self = [super initWithFrame:frame];
    if (self) {
        //整个控件的宽高
        CGFloat width=frame.size.width;
        CGFloat height=frame.size.height;
        
        _spacing=spacing;
        
        _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, width/3 , height)];
        _label.backgroundColor=[UIColor clearColor];
        _label.textAlignment=NSTextAlignmentRight;
        [self addSubview:_label];
        NSLog(@"self:%@",self);//self指的是LTView1
        
        
        _textField=[[UITextField alloc]initWithFrame:CGRectMake(width/3 + _spacing, 0, width-width/3 + _spacing, height)];
        _textField.borderStyle=UITextBorderStyleRoundedRect;
        [self addSubview:_textField];
        
        [self setSpacing:10];
        [self setLabelText:labelText];
        [self setText:text];
        _textField.placeholder=placeholder;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame labelText:(NSString *)labelText placeholder:(NSString *)placeholder spacing:(CGFloat)spacing
{
    
    return [self initWithFrame:frame labelText:labelText text:nil placeholder:placeholder spacing:0];
}

-(void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    _delegate=delegate;
    _textField.delegate=_delegate;//核心
}
-(id<UITextFieldDelegate>)delegate
{
    return _delegate;
}

-(void)setSpacing:(CGFloat)spacing
{
    _spacing=spacing;
    _textField.frame=CGRectMake(_label.frame.size.width+spacing, 0, self.frame.size.width-_label.frame.size.width-spacing, self.frame.size.height);
}


//设置Label的文字
-(void)setLabelText:(NSString *)text
{
    _label.text=text;
}
//获取Label的文字
-(NSString *)labelText
{
    return _label.text;
}

//设置_textField的文字
-(void)setText:(NSString *)text
{
    _textField.text=text;
}
//获取_textField的文字
-(NSString *)text
{
    return _textField.text;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
