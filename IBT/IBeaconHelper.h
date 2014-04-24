#import "IBTViewController.h"

@class IBTViewController;
@class CLLocationManager;

@interface IBeaconHelper : NSObject <CLLocationManagerDelegate>

@property (weak, nonatomic) IBTViewController *controller;
@property (strong, nonatomic) CLLocationManager *locationManager;

- (id)init:(IBTViewController *)controller;

@end