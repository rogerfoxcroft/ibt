//
//  com_softfox_ibtViewController.m
//  IBT
//
//  Created by Roger Foxcroft on 24/04/2014.
//  Copyright (c) 2014 Softfox. All rights reserved.
//

#import "IBTViewController.h"
#import "IBeaconHelper.h"

@interface IBTViewController ()

@end

@implementation IBTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create a new IBeaconHelper to handle the scanning for iBeacons
    self.iBeaconHelper = [[IBeaconHelper alloc] init:self];
    
    
    [self writeToConsole: @"iBeacon Transmitter ready"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    self.ibtConsole.text = @"Console cleared to save memory";
}

- (void)writeToConsole:(NSString *) str
{
    NSString *consoleText = self.ibtConsole.text;
    NSString *dateText = [[NSDate date] description];
    consoleText = [consoleText stringByAppendingString:
                   [@"\n" stringByAppendingString:
                    [dateText stringByAppendingString:
                     [@" - " stringByAppendingString: str]]]];
    self.ibtConsole.text = consoleText;
}

@end
