//
//  UIView+TCF.m
//  TCoreFoundation
//
//  Created by Tony Hauber on 11/7/12.
//
//

#import "UIView+TCF.h"

@implementation UIView (TCF)

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat) right
{
    return CGRectGetMaxX(self.frame);
}

- (void) setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat) bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void) setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

@end
