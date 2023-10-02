//
//  ActionTableViewCell.m
//  ButtonDemoApp
//
//  Created by REVE Systems on 17/9/23.
//

#import "ActionTableViewCell.h"
#import "ButtonCollectionViewCell.h"

@implementation ActionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.buttonCollectionView.delegate = self;
    self.buttonCollectionView.dataSource = self;
    [self.buttonCollectionView registerNib:[UINib nibWithNibName:@"ButtonCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ButtonCell"];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 5;
    [self.buttonCollectionView setCollectionViewLayout:layout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.buttonCollectionView layoutIfNeeded];
        CGSize collectionViewSize = self.buttonCollectionView.collectionViewLayout.collectionViewContentSize;
        self.collectionViewHeightConstraint.constant = collectionViewSize.height;
    });
}

- (CGFloat)calculateTotalHeight {
    CGFloat totalHeight = 0;
    
    for (UIView *subview in self.contentView.subviews) {
        if (!subview.isHidden && ![subview isKindOfClass:[UICollectionView class]]) {
            totalHeight += subview.frame.size.height;
        }
    }
    
    // Calculate height of buttonCollectionView and add it to totalHeight
    CGFloat buttonCollectionViewHeight = [self calculateHeightForButtonCollectionView];
    totalHeight += buttonCollectionViewHeight;
    
    return totalHeight;
}

- (CGFloat)calculateHeightForButtonCollectionView {
    // Given constraints
    NSInteger fixedWidth = 320; // Replace with the actual fixed width of your buttonCollectionView
    
    // Dynamically get the spacing from UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.buttonCollectionView.collectionViewLayout;
    NSInteger horizontalGapBetweenCells = layout.minimumInteritemSpacing;
    NSInteger verticalGapBetweenCells = layout.minimumLineSpacing;
    
    // Array to hold widths and heights of each ButtonCollectionViewCell
    NSMutableArray *cellDimensions = [NSMutableArray array];
    
    for (NSString *text in self.buttonArray) {
        float cellWidth = [text widthForFont:[UIFont systemFontOfSize:17] maxWidth:300]; // Adjust the font and maxWidth as needed
        float cellHeight = [text heightForFont:[UIFont systemFontOfSize:17] calculatedTextWidth:cellWidth]; // Adjust the font as needed
        [cellDimensions addObject:@{@"width": @(cellWidth), @"height": @(cellHeight)}];
    }
    
    NSInteger sum = 0;
    CGFloat maxRowHeight = 0;
    CGFloat totalHeight = 0;
    
    for (NSDictionary *dimension in cellDimensions) {
        NSInteger newSum = sum;
        CGFloat currentHeight = [dimension[@"height"] floatValue];
        
        if (newSum != 0) {
            newSum += horizontalGapBetweenCells;
        }
        
        newSum += [dimension[@"width"] integerValue];
        
        if (newSum <= fixedWidth) {
            sum = newSum;
            maxRowHeight = MAX(maxRowHeight, currentHeight);
        } else {
            totalHeight += maxRowHeight + verticalGapBetweenCells;
            sum = [dimension[@"width"] integerValue];
            maxRowHeight = currentHeight;
        }
    }
    
    totalHeight += maxRowHeight + verticalGapBetweenCells;
    return totalHeight;
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
    float finalWidth = [text widthForFont:[UIFont systemFontOfSize:17] maxWidth:300];
    float finalHeight = [text heightForFont:[UIFont systemFontOfSize:17] calculatedTextWidth:finalWidth];
    return CGSizeMake(finalWidth, finalHeight);
}

@end
