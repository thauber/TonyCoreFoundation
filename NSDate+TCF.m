//
//  NSDate+NSDate_dateUtil.m
//  WhereYouAt
//
//  Created by Tony Hauber on 11/2/12.
//
//

#import "NSString+TCF.h"
#import "NSDate+TCF.h"

@implementation NSDate (TCF)

-(NSString *)formattedTimeSinceNow {
    double ti = [self timeIntervalSinceNow];
    ti = ti * -1;
    if(ti < 1) {
        return @"now";
    } else 	if (ti < 60) {
        return @"now";
    } else if (ti < 60*60) {
        int diff = round(ti / 60);
        NSString *timeUnit = [@"minute" pluralize:diff];
        return [NSString stringWithFormat:@"%d %@ ago", diff, timeUnit];
    } else if (ti < 60*60*24) {
        int diff = round(ti / 60 / 60);
        NSString *timeUnit = [@"hour" pluralize:diff];
        return [NSString stringWithFormat:@"%d %@ ago", diff, timeUnit];
    } else if (ti < 60*60*24*7) {
        int diff = round(ti / 60 / 60 / 24);
        NSString *timeUnit = [@"day" pluralize:diff];
        return [NSString stringWithFormat:@"%d %@ ago", diff, timeUnit];
    } else if (ti < 60*60*24*7*4) {
        int diff = round(ti / 60 / 60 / 24 / 7);
        NSString *timeUnit = [@"week" pluralize:diff];
        return [NSString stringWithFormat:@"%d %@ ago", diff, timeUnit];
    } else if (ti < 60*60*24*7*4*12) {
        int diff = round(ti / 60 / 60 / 24 / 7 / 4);
        NSString *timeUnit = [@"month" pluralize:diff];
        return [NSString stringWithFormat:@"%d %@ ago", diff, timeUnit];
    } else if (ti < 60*60*24*7*4*12*2) {
        return @"1 year ago";
    }
    return @"Years ago";
}


/*
 This should really be part of CCF instead of TCF but I guess it works here...
 
 All dates sent to and from the server should be in GMT. These functions let you convert timezones.
*/
-(NSDate *) toLocalTime
{
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

-(NSDate *) toGlobalTime
{
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = -[tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

@end
