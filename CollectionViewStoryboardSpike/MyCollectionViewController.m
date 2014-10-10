//
//  MyCollectionViewController.m
//  CollectionViewStoryboardSpike
//
//  Created by u16suzu on 2014/10/10.
//  Copyright (c) 2014年 IGNIS LTD. All rights reserved.
//

#import "MyCollectionViewController.h"

@interface MyCollectionViewController()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
}

#pragma mark -collection view delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //とりあえずセクションは2つ
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section==0){//セクション0には５個
        return 5;
    }else if(section==1){ //セクション1には7個
        return 7;
    }else{
        return 0;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //クリックされたらよばれる
    NSLog(@"Clicked %ld-%ld", indexPath.section, indexPath.row);
}

//Method to create cell at index path
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    
    if(indexPath.section==0){//セクション0のセル
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor greenColor];
        
        UILabel *label = (UILabel *)[cell viewWithTag:1];
        label.text = [NSString stringWithFormat:@"ラベル%ld-%ld",indexPath.section,indexPath.row];
        
        UIImageView *image = (UIImageView *)[cell viewWithTag:2];
        image.backgroundColor = [UIColor redColor];
        
    }else if(indexPath.section==1){//セクション1のセル
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor yellowColor];
        
        UIButton *button = (UIButton *)[cell viewWithTag:1];
        button.titleLabel.text = [NSString stringWithFormat:@"%ld-%ld",indexPath.section,indexPath.row];
        
        UILabel *label = (UILabel *)[cell viewWithTag:2];
        label.text = [NSString stringWithFormat:@"ラベル%ld-%ld", indexPath.section,indexPath.row];
    }
    
    return cell;
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
