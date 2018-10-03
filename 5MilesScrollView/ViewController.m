//
//  ViewController.m
//  5MilesScrollView
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "ViewController.h"
#import "TopCollectionViewCell.h"
#import "BottomCollectionViewCell.h"
@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, UICollectionViewDataSourcePrefetching> {
    
    __weak IBOutlet UICollectionView *collectionViewTop;
    
    __weak IBOutlet UICollectionView *collectionViewBottom;
    
    NSInteger counter;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    counter = 0;
    [collectionViewTop registerNib:[UINib nibWithNibName:@"TopCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"topcell"];
    [collectionViewBottom registerNib:[UINib nibWithNibName:@"BottomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"bottomcell"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1.0;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionViewBottom == collectionView) {
        BottomCollectionViewCell *bottomCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bottomcell" forIndexPath:indexPath];
        [bottomCell bindData:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
        return bottomCell;
    } else {
        
        TopCollectionViewCell *topCell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"topcell" forIndexPath:indexPath];
        [topCell bindData: [NSString stringWithFormat:@"%ld",(long)indexPath.row]];
        return  topCell;
    }

    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == collectionViewTop) {
        return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
    }
    return CGSizeMake(80 , 80);
}




-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (collectionView == collectionViewTop) {
        return 0;
    }
    return 4.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (collectionView == collectionViewTop) {
        return 0;
    }
    return 4.0;
}


- (void)moveToFrame:(CGFloat)contentOffset {
    CGRect frame = CGRectMake(contentOffset, collectionViewBottom.contentOffset.y, collectionViewBottom.frame.size.width, collectionViewBottom.frame.size.height);
    [collectionViewBottom scrollRectToVisible:frame animated:YES];
}


-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    counter = indexPath.row;
    NSLog(@"ACTUAL ---- CURRENT INDEX PATH ==== %ld",(long)indexPath.row);
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    counter = indexPath.row;
   
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
   
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == collectionViewTop) {
         [self updateBottomViewState];
    } else {
       
    }
    
}

- (void)updateBottomViewState {
    
    [collectionViewBottom scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:counter inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
    
    for (BottomCollectionViewCell *bottomCell in collectionViewBottom.visibleCells) {
        [bottomCell setSelected:NO];
    }
    
    BottomCollectionViewCell *bottomCell = (BottomCollectionViewCell *) [collectionViewBottom cellForItemAtIndexPath:[NSIndexPath indexPathForRow:counter inSection:0]];
    [bottomCell setSelected:YES];
    
    
   // [bottomCell backGroundColor:[UIColor greenColor]];
}

-(void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
}
@end
