//
//  ButtonCollectionViewCell.m
//  ButtonDemoApp
//
//  Created by REVE Systems on 14/9/23.
//

#import "ButtonCollectionViewCell.h"

@implementation ButtonCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.actionButton.layer.cornerRadius = 12;
    self.actionButton.layer.borderWidth = 1;
    self.actionButton.layer.borderColor = UIColor.blueColor.CGColor;
    self.actionButton.backgroundColor = UIColor.clearColor;
    self.actionButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.actionButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.actionButton.titleLabel.numberOfLines = 1;
}

- (IBAction)buttonTapped:(id)sender {
    NSLog(@"%@\n",self.titleLabel.text);
    
    UIColor *originalColor = self.actionButton.backgroundColor;

    self.actionButton.backgroundColor = [UIColor grayColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.actionButton.backgroundColor = originalColor;
    });
}


@end
