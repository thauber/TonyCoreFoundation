//
//  UIView+TCF.h
//  TCoreFoundation
//
//  Created by Tony Hauber on 11/7/12.
//
//


typedef void (^TCFTapHandler)(id sender);

@interface UIView (TFC)

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, readonly) CGPoint boundedCenter;
@property (nonatomic, strong) TCFTapHandler tapHandler;

- (void) stretchBottomTo:(CGFloat)newBottom;

@end

