//
//  ButtonCollectionViewCell.h
//  ButtonDemoApp
//
//  Created by REVE Systems on 14/9/23.
//

#import <UIKit/UIKit.h>

@interface ButtonCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
