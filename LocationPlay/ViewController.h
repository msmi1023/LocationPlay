//
//  ViewController.h
//  LocationPlay
//
//  Created by tstone10 on 6/2/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<GMSMapViewDelegate, CLLocationManagerDelegate>

@end