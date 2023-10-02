//
//  ActionTableViewCell.h
//  ButtonDemoApp
//
//  Created by REVE Systems on 17/9/23.
//

#import <UIKit/UIKit.h>
#import "NSString+ButtonDemoApp.h"

@interface ActionTableViewCell : UITableViewCell<UICollectionViewDelegate,
UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *buttonCollectionView;
@property (strong, nonatomic) NSArray *buttonArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightConstraint;

- (CGFloat)calculateHeightForButtonCollectionView;
@end
