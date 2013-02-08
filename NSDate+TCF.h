//
//  NSDate+NSDate_dateUtil.h
//  WhereYouAt
//
//  Created by Tony Hauber on 11/2/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (TCF)

-(NSString *)formattedTimeSinceNow;

-(NSDate *) toLocalTime;

-(NSDate *) toGlobalTime;

@end
