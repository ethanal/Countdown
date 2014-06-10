//
//  AppDelegate.m
//  Countdown
//
//  Created by Ethan Lowman on 6/20/13.
//  Copyright (c) 2013 Ethan Lowman. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)updateDaysUntilDate{
    NSTimeInterval interval = [[self.prefs objectForKey:@"date"] timeIntervalSinceReferenceDate] - [[NSDate date] timeIntervalSinceReferenceDate];
    NSInteger days = ceil(interval/(60*60*24));
    self.statusBar.title = [NSString stringWithFormat:@"%ld", days];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;
    
    self.prefs = [NSUserDefaults standardUserDefaults];
    
    NSDate *datePref = [self.prefs objectForKey:@"date"];
    if(datePref == nil){
        NSDate *today = [[NSDate date] dateByAddingTimeInterval:10*24*60*60];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:today];
        [components setHour:0];
        [components setMinute:0];
        NSDate *datePref = [calendar dateFromComponents:components];
        [self.prefs setObject:datePref forKey:@"date"];
    }
    [self.date setDateValue:datePref];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateDaysUntilDate) userInfo:nil repeats:YES];
}

- (IBAction)showSettings:(id)sender {
    if(! [self.window isVisible] )
        [self.window makeKeyAndOrderFront:sender];
    [NSApp activateIgnoringOtherApps:YES];
}

- (IBAction)setEndDate:(id)sender {
    [self.prefs setObject:[self.date dateValue] forKey:@"date"];
    [self updateDaysUntilDate];
}
@end
