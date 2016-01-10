//
//  ViewController.m
//  TimestampConverter
//
//  Created by Tim on 28/04/15.
//  Copyright (c) 2015 TimHuijser. All rights reserved.
//

#import "ViewController.h"
#import "Timestamp.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.previousTimestamps = [[NSMutableArray alloc] init];
    
    // Prefill all inputfields with current date.
    [self fillCurrentDateAndTimestampInputFields];
    
    // Let button listen to enter key.
    [self.generateTimestampButton setKeyEquivalent:@"\r"];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)generateCurrentButton:(id)sender {
    
    [self fillCurrentDateAndTimestampInputFields];
    
}

- (IBAction)generateTimestampButton:(id)sender {
    
    if ([self checkDateTextFields]) {
        
        NSString *seconds = [self.secondsTextField stringValue];
        NSString *minutes = [self.minutesTextField stringValue];
        NSString *hours = [self.hoursTextField stringValue];
        NSString *day = [self.dayTextField stringValue];
        NSString *month = [self.monthTextField stringValue];
        NSString *year = [self.yearTextField stringValue];
        
        NSString *dateString = [NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@", day, month, year, hours, minutes, seconds];
        
        NSDate *dateFromString = [self dateStringToNSDate:dateString];
        
        [self fillTimestampInputField:dateFromString];
        
        [self addDateToTimestampArray:dateFromString];
        
    } else {
        
        // !TODO Add error state.
        
    }
    
}

- (IBAction)generateDateButton:(id)sender {
    
    NSString *timestampString = self.timestampTextField.stringValue;
    NSTimeInterval timestampInterval = [timestampString doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestampInterval];
    
    [self fillDateInputFields:date];
    
    [self addDateToTimestampArray:date];

}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if ([tableColumn.identifier isEqualToString:@"TimestampColumn"]) {
        
        Timestamp *timestamp = [self.previousTimestamps objectAtIndex:row];
        cellView.textField.stringValue = [NSString stringWithFormat:@"%d", timestamp.timestamp];;
        
        return cellView;
        
    } else if ([tableColumn.identifier isEqualToString:@"DateColumn"]) {
        
        Timestamp *timestamp = [self.previousTimestamps objectAtIndex:row];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
        NSString *dateString = [dateFormatter stringFromDate:timestamp.date];
        
        cellView.textField.stringValue = dateString;
        
        return cellView;
        
    }
    
    return cellView;
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.previousTimestamps count];
}

- (void)addDateToTimestampArray:(NSDate *)date {
    
    if ([self.previousTimestamps count] > 0) {
        
        Timestamp *previousTimestamp = [self.previousTimestamps objectAtIndex:0];
        
        // Check if previous stored timestamp is equal to current timestamp.
        if (![previousTimestamp.date isEqualToDate:date]) {
            
            // Only when timestamps are not equal, store it to avoid duplicate stores.
            Timestamp *addTimestamp = [[Timestamp alloc] initWithDate:date];
            [self.previousTimestamps insertObject:addTimestamp atIndex:0];
            
            [self.timestampTableView.documentView reloadData];
            
        }
        
    } else {
        
        Timestamp *addTimestamp = [[Timestamp alloc] initWithDate:date];
        [self.previousTimestamps insertObject:addTimestamp atIndex:0];
        
        [self.timestampTableView.documentView reloadData];
        
    }
    
}

- (Boolean)checkDateTextFields {
    
    if (
        [[self.secondsTextField stringValue] length] <= 2 &&
        [[self.minutesTextField stringValue] length] <= 2 &&
        [[self.hoursTextField stringValue] length] <= 2 &&
        [[self.dayTextField stringValue] length] <= 2 &&
        [[self.monthTextField stringValue] length] <= 2 &&
        [[self.yearTextField stringValue] length] == 4
    ) {
        return TRUE;
    } else {
        return FALSE;
    }

}

- (NSDate *)dateStringToNSDate:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];
    
    return dateFromString;
    
}

- (void)fillTimestampInputField:(NSDate *)date {
    
    int timestamp = [date timeIntervalSince1970];
    
    self.timestampTextField.stringValue = [NSString stringWithFormat:@"%d", timestamp];
    
}

- (void)fillDateInputFields:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+2"]];
    
    [dateFormatter setDateFormat:@"ss"];
    NSString *seconds = [dateFormatter stringFromDate:date];
    self.secondsTextField.stringValue = seconds;
    
    [dateFormatter setDateFormat:@"mm"];
    NSString *minutes = [dateFormatter stringFromDate:date];
    self.minutesTextField.stringValue = minutes;
    
    [dateFormatter setDateFormat:@"HH"];
    NSString *hours = [dateFormatter stringFromDate:date];
    self.hoursTextField.stringValue = hours;
    
    [dateFormatter setDateFormat:@"dd"];
    NSString *day = [dateFormatter stringFromDate:date];
    self.dayTextField.stringValue = day;
    
    [dateFormatter setDateFormat:@"MM"];
    NSString *month = [dateFormatter stringFromDate:date];
    self.monthTextField.stringValue = month;
    
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *year = [dateFormatter stringFromDate:date];
    self.yearTextField.stringValue = year;
    
}

- (void)fillCurrentDateAndTimestampInputFields {
    
    NSDate *currentDate = [NSDate date];
    
    [self fillTimestampInputField:currentDate];
    
    [self fillDateInputFields:currentDate];
    
}

@end
