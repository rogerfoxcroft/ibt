//
//  com_softfox_ibtViewController.h
//  IBT
//
//  Created by Roger Foxcroft on 24/04/2014.
//  Copyright (c) 2014 Softfox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class IBeaconHelper;

@interface IBTViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *ibtConsole;
@property (strong, nonatomic) IBeaconHelper *iBeaconHelper;

- (void) writeToConsole:(NSString *) str;

@end
