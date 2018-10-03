//
//  BottomCollectionViewCell.m
//  5MilesScrollView
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "BottomCollectionViewCell.h"

@implementation BottomCollectionViewCell {
    
    __weak IBOutlet UIImageView *baseImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setSelected:(BOOL)selected {
    
    [super setSelected:selected];
    
    
    if (selected) {
        baseImageView.backgroundColor = [UIColor greenColor];
    } else {
        baseImageView.backgroundColor = [UIColor redColor];
    }
 
    
    
}
- (void)bindData:(NSString *)title {
    lblTitle.text = title;
}

- (void)backGroundColor: (UIColor *)color {
    baseImageView.backgroundColor = color;
}
@end
