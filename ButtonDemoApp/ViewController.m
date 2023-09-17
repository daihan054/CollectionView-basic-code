//
//  ViewController.m
//  ButtonDemoApp
//
//  Created by REVE Systems on 14/9/23.
//

#import "ViewController.h"
#import "ButtonCollectionViewCell.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonArray = @[@"Go to text", @"Go to image node Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc", @"Go to question node"];
   
    // Setting delegate and data source
    self.buttonCollectionView.delegate = self;
    self.buttonCollectionView.dataSource = self;
    
    // Layout setup
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 20);
    layout.minimumLineSpacing = 8; // Vertical spacing
    layout.minimumInteritemSpacing = 2; // Horizontal spacing
    
    // Apply layout
    [self.buttonCollectionView setCollectionViewLayout:layout];
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float finalWidth = [self calculateWidthForIndexPath:indexPath];
    return CGSizeMake(finalWidth, 50);
}

@end
