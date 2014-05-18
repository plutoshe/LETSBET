//
//  PSDetailViewController.h
//  LetsBet
//
//  Created by PlutoShe on 5/18/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import "PSViewController.h"

@interface PSDetailViewController : PSViewController
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *PartyA;
@property (weak, nonatomic) IBOutlet UILabel *PartyB;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property int row;
@property (weak, nonatomic) IBOutlet UIButton *PA;
@property (weak, nonatomic) IBOutlet UIButton *PB;
@property NSDictionary *data;
 @property (copy) void(^callback)(int value1);
@end
