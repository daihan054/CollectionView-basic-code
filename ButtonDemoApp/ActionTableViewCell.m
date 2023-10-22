//
//  ActionTableViewCell.m
//  ButtonDemoApp
//
//  Created by REVE Systems on 17/9/23.
//

#import "ActionTableViewCell.h"
#import "ButtonCollectionViewCell.h"

#define BUTTON_CELL_MAX_WIDTH 200
#define BUTTON_COLLECTIONVIEW_MAX_WIDTH 280

@implementation ActionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.buttonCollectionView.delegate = self;
    self.buttonCollectionView.dataSource = self;
    [self.buttonCollectionView registerNib:[UINib nibWithNibName:@"ButtonCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ButtonCell"];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 3.5;
    [self.buttonCollectionView setCollectionViewLayout:layout];
    self.collectionViewWidthConstraint.constant = BUTTON_COLLECTIONVIEW_MAX_WIDTH;
}

- (CGFloat)calculateTotalHeight {
    CGFloat totalHeight = 0;
    
    for (UIView *subview in self.contentView.subviews) {
        if (!subview.isHidden && ![subview isKindOfClass:[UICollectionView class]]) {
            totalHeight += subview.frame.size.height;
        }
    }
    
    CGFloat buttonCollectionViewHeight = self.buttonCollectionView.collectionViewLayout.collectionViewContentSize.height;
    totalHeight += buttonCollectionViewHeight;
    
    return totalHeight + 20;
}

#pragma mark - UICollectionView DataSource & Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.buttonArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ButtonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ButtonCell" forIndexPath:indexPath];
    NSString *buttonTitle = self.buttonArray[indexPath.item];
    cell.titleLabel.text = buttonTitle;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.buttonArray[indexPath.item];
    float finalWidth = [text widthForFont:[UIFont systemFontOfSize:17] maxWidth:BUTTON_CELL_MAX_WIDTH];
    float finalHeight = [text heightForFont:[UIFont systemFontOfSize:17] calculatedTextWidth:finalWidth];
    return CGSizeMake(finalWidth, finalHeight);
}

@end
