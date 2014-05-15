//
//  PSViewController.h
//  LetsBet
//
//  Created by PlutoShe on 5/14/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTutorialPage.h"
#define TUTORIAL_LABEL_TEXT_COLOR               [UIColor whiteColor]
#define TUTORIAL_LABEL_HEIGHT                   34
#define TUTORIAL_SUB_TITLE_FONT                 [UIFont fontWithName:@"Helvetica-Bold" size:17.0f]
#define TUTORIAL_SUB_TITLE_LINES_NUMBER         1
#define TUTORIAL_SUB_TITLE_OFFSET               180
#define TUTORIAL_DESC_FONT                      [UIFont fontWithName:@"Helvetica" size:15.0f]
#define TUTORIAL_DESC_LINES_NUMBER              2
#define TUTORIAL_DESC_OFFSET                    150
#define TUTORIAL_DEFAULT_DURATION_ON_PAGE       3.0f
@interface PSViewController : UIViewController<UIScrollViewDelegate>

@end
