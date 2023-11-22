//
//  CustomFlowLayout.m
//  ButtonDemoApp
//
//  Created by REVE Systems on 22/11/23.
//

// CustomFlowLayout.m
#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    CGFloat sumOfWidth = 0.0; // Initialize sumOfWidth

    // Loop through all the attributes to adjust positions
    for (int i = 0; i < [attributes count]; ++i) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];

        if (i == 0) { // This is the first item in a section
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = self.sectionInset.left; // Start at the section inset
            currentLayoutAttributes.frame = frame;
            sumOfWidth = CGRectGetMaxX(frame); // Set the initial sumOfWidth
        } else {
            CGRect currentFrame = currentLayoutAttributes.frame;
            CGFloat maximumSpacing = self.minimumInteritemSpacing;
            
            // Check if adding this item would exceed the width of the collection view
            if (sumOfWidth + maximumSpacing + currentFrame.size.width < self.collectionViewContentSize.width) {
                currentFrame.origin.x = sumOfWidth + maximumSpacing; // Update the X position
                currentLayoutAttributes.frame = currentFrame; // Set the new frame
                sumOfWidth += maximumSpacing + currentFrame.size.width; // Update sumOfWidth
            } else { // If the item doesn't fit in the current row, reset sumOfWidth and position it in a new row
                currentFrame.origin.x = self.sectionInset.left; // New item will be at the start of the next row
                currentLayoutAttributes.frame = currentFrame; // Set the new frame
                sumOfWidth = CGRectGetMaxX(currentFrame); // Reset sumOfWidth for the new row
            }
        }
    }
    
    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    // Invalidate layout on bounds change to recalculate cell positions.
    return YES;
}

@end



