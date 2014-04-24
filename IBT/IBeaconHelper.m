#include <CoreLocation/CoreLocation.h>

#include "IBeaconHelper.h"
#include "IBTViewController.h"

@implementation IBeaconHelper

- (id)init:(IBTViewController *) controller
{
    self = [super init];
    self.controller = controller;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self initialChecks];
    [self startMonitoringForBeacons];
    
    return self;
}

- (void)initialChecks
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized)
    {
        [self.controller writeToConsole:@"Region Monitoring is not available on this device"];
    }


    if (![CLLocationManager locationServicesEnabled])
    {
        [self.controller writeToConsole:@"Location services are not enabled on this device"];
    }
}

- (void)startMonitoringForBeacons
{
    // Use a hard-coded UUID for now
    NSString *uuidStr = @"38D50911-4901-4F56-8952-3C3ACD860E0B";
    
    // Convert this string into a NSUUID object
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString: uuidStr];
    
    // Create a beacon region for this uuid
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID: (uuid)  identifier:@"softfox-test"];
    
    // Finally register this beacon region with the location manager and start monitoring
    [self.locationManager startMonitoringForRegion:beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    [self.controller writeToConsole:[@"Entered new region: " stringByAppendingString:[region description]]];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    [self.controller writeToConsole:[@"Exited region region: " stringByAppendingString:[region description]]];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    [self.controller writeToConsole:[@"Starting monitoring region: " stringByAppendingString:[region description]]];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    [self.controller writeToConsole:[@"Beacons currently in region: " stringByAppendingString:[region description]]];
}

@end