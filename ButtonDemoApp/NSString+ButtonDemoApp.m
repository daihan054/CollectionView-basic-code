//
//  NSString+ButtonDemoApp.m
//  ButtonDemoApp
//
//  Created by REVE Systems on 2/10/23.
//

#import "NSString+ButtonDemoApp.h"

@implementation NSString (ButtonDemoApp)

-(CGFloat) widthForFont:(UIFont*)font maxWidth:(CGFloat)maxWidth {
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, 50);
    CGRect labelRect = [self boundingRectWithSize:maxSize
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:attributes
                                          context:nil];
    
    CGFloat textWidth = labelRect.size.width + 20;
    CGFloat finalWidth = MIN(textWidth, maxWidth);
    
    return finalWidth;
}

- (CGFloat)heightForFont:(UIFont*)font calculatedTextWidth:(CGFloat)width {
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    CGSize maxSize = CGSizeMake(width, CGFLOAT_MAX);
    CGRect labelRect = [self boundingRectWithSize:maxSize
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:attributes
                                          context:nil];
    
    CGFloat textHeight = labelRect.size.height + 20;
    
    return textHeight;
}
@end
