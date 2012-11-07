//
//  NSString+stringUtil.m
//  WhereYouAt
//
//  Created by Tony Hauber on 11/2/12.
//
//

#import "NSString+TCF.h"

@implementation NSString (TCF)

- (NSString*)pluralize:(NSInteger)count {
    if (count==1) {
        return [[self copy] autorelease];
    } else {
        return [NSString stringWithFormat:@"%@s", self];
    }
}

@end
