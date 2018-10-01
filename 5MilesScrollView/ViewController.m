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
@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate> {
    
    __weak IBOutlet UICollectionView *collectionViewTop;
    
    __weak IBOutlet UICollectionView *collectionViewBottom;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
        UICollectionViewCell *bottomCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bottomcell" forIndexPath:indexPath];
        return bottomCell;
    } else {
        
        UICollectionViewCell *topCell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"topcell" forIndexPath:indexPath];
        return  topCell;
    }

    
}
@end
