//
//  PSTutorialPage.h
//  LetsBet
//
//  Created by PlutoShe on 5/14/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSTutorialLabelStyle : NSObject {
    NSString *_text;
    UIFont *_font;
    UIColor *_textColor;
    NSUInteger _linesNumber;
    NSUInteger _offset;
}

@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, assign) NSUInteger linesNumber;
@property (nonatomic, assign) NSUInteger offset;

// Init.
- (id)initWithText:(NSString *)text;
- (id)initWithText:(NSString *)text
              font:(UIFont *)font
         textColor:(UIColor *)color;
@end

@interface PSTutorialPage : NSObject {
    PSTutorialLabelStyle *_subTitle;
    PSTutorialLabelStyle *_description;
    NSString *_pictureName;
}

@property (nonatomic, retain) PSTutorialLabelStyle *subTitle;
@property (nonatomic, retain) PSTutorialLabelStyle *description;
@property (nonatomic, retain) NSString *pictureName;

// Init.
- (id)initWithSubTitle:(NSString *)subTitle
           description:(NSString *)description
           pictureName:(NSString *)pictureName;

- (void)setSubTitleStyle:(PSTutorialLabelStyle *)style;
- (void)setDescription:(PSTutorialLabelStyle *)style;

@end


