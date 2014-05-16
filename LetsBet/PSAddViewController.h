//
//  PSAddViewController.h
//  LetsBet
//
//  Created by PlutoShe on 5/16/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSAddViewController : UIViewController
 @property (copy) void(^callback)(NSString *value1, NSString *value2);
@end
