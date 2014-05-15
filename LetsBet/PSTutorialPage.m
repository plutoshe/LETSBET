//
//  PSTutorialPage.m
//  LetsBet
//
//  Created by PlutoShe on 5/14/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import "PSTutorialPage.h"



@implementation PSTutorialLabelStyle
@synthesize font = _font;
@synthesize text = _text;
@synthesize textColor = _textColor;
@synthesize linesNumber = _linesNumber;
@synthesize offset = _offset;

// Init.
- (id)initWithText:(NSString *)text
{
    self = [super init];
    if (self){
        _text = text;
    }
    return self;
}

- (id)initWithText:(NSString *)text
              font:(UIFont *)font
         textColor:(UIColor *)color
{
    self = [self initWithText:text];
    if (self){
        _font = font;
        _textColor = color;
    }
    return self;
}

@end

@implementation PSTutorialPage
@synthesize subTitle = _subTitle;
@synthesize description = _description;
@synthesize pictureName = _pictureName;

// Init.
- (id)initWithSubTitle:(NSString *)subTitle
           description:(NSString *)description
           pictureName:(NSString *)pictureName{
    self = [super init];
    if (self){
        _subTitle = [[PSTutorialLabelStyle alloc] initWithText:subTitle];
        _description = [[PSTutorialLabelStyle alloc] initWithText:description];
        _pictureName = pictureName;
    }
    return self;
}

- (void)setSubTitleStyle:(PSTutorialLabelStyle *)style{
    [_subTitle setFont:style.font];
    [_subTitle setTextColor:style.textColor];
}

- (void)setDescription:(PSTutorialLabelStyle *)style{
    [_description setFont:style.font];
    [_description setTextColor:style.textColor];
}

@end

