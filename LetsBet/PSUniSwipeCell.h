//
//  PSUniSwipeCell.h
//  LetsBet
//
//  Created by PlutoShe on 5/15/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//
FOUNDATION_EXPORT CGFloat const kExampleCellHeight;

#import "SWTableViewCell.h"

@interface PSUniSwipeCell : SWTableViewCell

//@property (nonatomic, strong) UIImageView *exampleImageView;
//@property (nonatomic, strong) UILabel *exampleLabel;
@property (weak, nonatomic) IBOutlet UILabel *debtName;
@property (weak, nonatomic) IBOutlet UIImageView *debtImage;
@property (weak, nonatomic) IBOutlet UILabel *firstParty;
@property (weak, nonatomic) IBOutlet UILabel *secondParty;
@property (weak, nonatomic) IBOutlet UILabel *firstPenalty;
@property (weak, nonatomic) IBOutlet UILabel *secondPenalty;

@end
