//
//  LTView.h
//  LTView
//
//  Created by lanou3g on 14-4-11.
//  Copyright (c) 2014年 Chaiyahang. All rights reserved.
//

#import <UIKit/UIKit.h>
//为LTView添加实例变量
@interface LTView : UIView
{
    UILabel *_label;          //左边的label
    UITextField *_textField;  //右边的textField
}

@property (nonatomic,assign) id<UITextFieldDelegate> delegate;

@property (nonatomic,assign) CGFloat spacing;
@property (nonatomic,retain) UILabel *label;
@property (nonatomic,retain) UITextField *textField;
/**
 *  指定初始化方法
 *
 *  @param frame       整个控件的frame
 *  @param labelText   左边Label的文字
 *  @param text        右边输入框的文字
 *  @param placeholder 右边输入框的占位符
 *
 *  @return 返回一个LTView对象
 */
-(id)initWithFrame:(CGRect)frame labelText:(NSString *)labelText text:(NSString *)text placeholder:(NSString *)placeholder spacing:(CGFloat)spacing;

-(id)initWithFrame:(CGRect)frame labelText:(NSString *)labelText placeholder:(NSString *)placeholder spacing:(CGFloat)spacing;


//设置_label的文字
-(void)setLabelText:(NSString *)text;
//获取_label的文字
-(NSString *)labelText;

//设置_textField的文字
-(void)setText:(NSString *)text;
//获取_textField的文字
-(NSString *)text;

@end
