//
//  AppDelegate.h
//  Countdown
//
//  Created by Ethan Lowman on 6/20/13.
//  Copyright (c) 2013 Ethan Lowman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong, nonatomic) NSStatusItem *statusBar;
@property (strong) IBOutlet NSMenu *statusMenu;
@property (strong) NSUserDefaults *prefs;
@property (strong, nonatomic) IBOutlet NSDatePickerCell *date;

- (IBAction)setEndDate:(id)sender;
- (void)updateDaysUntilDate;

@end
