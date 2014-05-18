//
//  PSGloSwipeCell.h
//  LetsBet
//
//  Created by PlutoShe on 5/18/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

FOUNDATION_EXPORT CGFloat const kExampleCellHeight;

#import "SWTableViewCell.h"

@interface PSUniSwipeCell : SWTableViewCell

//@property (nonatomic, strong) UIImageView *exampleImageView;
//@property (nonatomic, strong) UILabel *exampleLabel;
@property (weak, nonatomic) IBOutlet UILabel *debtName;

@end
