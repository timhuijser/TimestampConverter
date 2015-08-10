//
//  ViewController.h
//  TimestampConverter
//
//  Created by Tim on 28/04/15.
//  Copyright (c) 2015 TimHuijser. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@import Foundation;

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *yearTextField;
@property (weak) IBOutlet NSTextField *monthTextField;
@property (weak) IBOutlet NSTextField *dayTextField;
@property (weak) IBOutlet NSTextField *hoursTextField;
@property (weak) IBOutlet NSTextField *minutesTextField;
@property (weak) IBOutlet NSTextField *secondsTextField;
@property (weak) IBOutlet NSTextField *timestampTextField;
@property (weak) IBOutlet NSButton *generateTimestampButton;

@property (strong) NSMutableArray *previousTimestamps;
@property (weak) IBOutlet NSScrollView *timestampTableView;

- (IBAction)generateTimestampButton:(id)sender;
- (IBAction)generateDateButton:(id)sender;

@end

