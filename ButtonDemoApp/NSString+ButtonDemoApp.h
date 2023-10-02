//
//  NSString+ButtonDemoApp.h
//  ButtonDemoApp
//
//  Created by REVE Systems on 2/10/23.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ButtonDemoApp)
- (CGFloat) widthForFont:(UIFont*)font maxWidth:(CGFloat)maxWidth;
- (CGFloat)heightForFont:(UIFont*)font calculatedTextWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
