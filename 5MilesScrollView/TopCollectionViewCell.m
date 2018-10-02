//
//  TopCollectionViewCell.m
//  5MilesScrollView
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "TopCollectionViewCell.h"

@implementation TopCollectionViewCell {
    
    __weak IBOutlet UILabel *lblTitle;\
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)bindData: (NSString *)title {
    lblTitle.text = title;
}
@end
