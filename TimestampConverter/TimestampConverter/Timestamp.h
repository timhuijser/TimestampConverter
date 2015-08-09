//
//  Timestamp.h
//  TimestampConverter
//
//  Created by Tim on 09/08/15.
//  Copyright (c) 2015 TimHuijser. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Timestamp : NSObject

@property (strong) NSDate *date;
@property int timestamp;

- (id)initWithDate:(NSDate*)date;

@end