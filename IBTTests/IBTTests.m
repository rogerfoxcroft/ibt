//
//  IBTTests.m
//  IBTTests
//
//  Created by Roger Foxcroft on 24/04/2014.
//  Copyright (c) 2014 Softfox. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreLocation/CoreLocation.h>
#import "IBeaconHelper.h"

@interface IBTTests : XCTestCase {
    IBeaconHelper *helper;
}

@end

@implementation IBTTests

- (void)setUp
{
    [super setUp];
    
    if (!(helper = [[IBeaconHelper alloc] init:NULL]))
    {
        XCTFail(@"Failed to create helper (%s)", __PRETTY_FUNCTION__);
    }
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testIBeaconRegionMonitoringAvailable
{
    if (![CLLocationManager locationServicesEnabled])
    {
        XCTFail(@"Location services are not enabled (%s)", __PRETTY_FUNCTION__);
    }
    
    // This test will fail if no Bluetooth 4 stack is set up to work with the simulator.
    // It has to be an external USB bluetooth dongle, and this is not really supported by Apple
    if (![CLLocationManager isRangingAvailable])
    {
        XCTFail(@"Ranging of iBeacons is not available (%s)", __PRETTY_FUNCTION__);
        return;
    }
}


@end
