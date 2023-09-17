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

// Existing methods and code
- (float)calculateWidthForIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.buttonArray[indexPath.item];
    
    ButtonCollectionViewCell *cell = (ButtonCollectionViewCell *)[self collectionView:self.buttonCollectionView cellForItemAtIndexPath:indexPath];
    
    UIFont *labelFont = cell.titleLabel.font;
    NSDictionary *attributes = @{NSFontAttributeName: labelFont};
    
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, 50);
    CGRect labelRect = [text boundingRectWithSize:maxSize
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:attributes
                                          context:nil];
    
    float textWidth = labelRect.size.width + 20;
    float maxWidth = 200;
    float finalWidth = MIN(textWidth, maxWidth);
    
    return finalWidth;
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
    float finalWidth = [self calculateWidthForIndexPath:indexPath];
    return CGSizeMake(finalWidth, 50);
}

@end
