//
//  UIView+TCF.m
//  TCoreFoundation
//
//  Created by Tony Hauber on 11/7/12.
//
//

#import "UIView+TCF.h"
#import <objc/runtime.h>

@interface UIView (TCF_Private)

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

@end

@implementation UIView (TCF)

#pragma mark - Convenient Dimensions 

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

- (CGPoint) boundedCenter {
    return CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
}

#pragma mark - Convenient Sizing

- (void) stretchBottomTo:(CGFloat)newBottom {
    CGFloat delta = newBottom - self.bottom;
    CGRect frame = self.frame;
    frame.size.height += delta;
    self.frame = frame;
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void) setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat) height
{
    return self.frame.size.height;
}

- (void) setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Tap Handler

static char tapHandlerKey;
static char tapRecognizerKey;

- (void)setTapHandler:(TCFTapHandler)tapHandler {
    objc_setAssociatedObject(self, &tapHandlerKey, tapHandler, OBJC_ASSOCIATION_RETAIN);
    if (tapHandler) {
        [self makeTapRecognizer];
    } else {
        self.tapRecognizer = nil;
    }
}

- (TCFTapHandler)tapHandler {
    return (TCFTapHandler)objc_getAssociatedObject(self, &tapHandlerKey);
}

- (void)setTapRecognizer:(UITapGestureRecognizer*)tapRecognizer {
    if (self.tapRecognizer) {
        [self removeGestureRecognizer:self.tapRecognizer];
    }
    objc_setAssociatedObject(self, &tapRecognizerKey, tapRecognizer, OBJC_ASSOCIATION_RETAIN);
    if (tapRecognizer) {
        [self addGestureRecognizer:tapRecognizer];
    }
}

- (UITapGestureRecognizer*) tapRecognizer {
    return (UITapGestureRecognizer*)objc_getAssociatedObject(self, &tapRecognizerKey);
}

- (void)makeTapRecognizer {
    if (self.tapRecognizer == nil) {
        self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(runTapHandler)];
    }
}

- (void)runTapHandler {
    if (self.tapHandler) {
        self.tapHandler(self);
    }
}

@end
