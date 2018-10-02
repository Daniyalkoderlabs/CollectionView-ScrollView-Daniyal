//
//  BottomCollectionViewCell.h
//  5MilesScrollView
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BottomCollectionViewCell : UICollectionViewCell {
    
    __weak IBOutlet UILabel *lblTitle;
}

- (void)bindData :(NSString *)title;
- (void)backGroundColor: (UIColor *)color;
@end

NS_ASSUME_NONNULL_END
