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
    self.actionButton.layer.borderWidth = 2;
    self.actionButton.layer.borderColor = UIColor.blueColor.CGColor;
    self.actionButton.backgroundColor = UIColor.clearColor;
    self.actionButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.actionButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.actionButton.titleLabel.numberOfLines = 1;
}

- (IBAction)buttonTapped:(id)sender {
    NSLog(@"%@\n",self.titleLabel.text);
}


@end
