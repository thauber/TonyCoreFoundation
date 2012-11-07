//
//  NSObject+NSObject_nullCheck.m
//  WhereYouAt
//
//  Created by Tony Hauber on 9/8/12.
//
//

#import "NSObject+TCF.h"

@implementation NSObject (TCF)

- (BOOL)isNull {
    return self == [NSNull null];
}

- (id) nilify {
    if ([self isNull]) {
        return nil;
    }
    return self;
}

@end
