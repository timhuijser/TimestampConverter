//
//  Timestamp.m
//  TimestampConverter
//
//  Created by Tim on 09/08/15.
//  Copyright (c) 2015 TimHuijser. All rights reserved.
//

#import "Timestamp.h"

@implementation Timestamp

- (id)initWithDate:(NSDate*)date {
    if ((self = [super init])) {
        self.date = date;
        self.timestamp = [date timeIntervalSince1970];
    }
    return self;
}

@end
