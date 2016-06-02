//
//  ViewController.m
//  LocationPlay
//
//  Created by tstone10 on 6/2/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"
@import GoogleMaps;

@implementation ViewController {
	GMSMapView *mapView_;
	//CLLocationManager *locationManager;
}

- (void)viewDidLoad {
	
	//locationManager = [[CLLocationManager alloc] init];
	
	//locationManager.delegate = self;
	//[locationManager requestWhenInUseAuthorization];
	
	
	GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:42.361760
															longitude:-83.072332
																 zoom:16];
	mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
	//mapView_.settings.compassButton = YES;
	mapView_.settings.myLocationButton = YES;
	mapView_.myLocationEnabled = YES;
	mapView_.delegate = self;
	self.view = mapView_;
	
	// Creates a marker in the center of the map.
	GMSMarker *marker = [[GMSMarker alloc] init];
	marker.position = CLLocationCoordinate2DMake(42.357999, -83.070916);
	marker.title = @"Taco Bell";
	marker.snippet = @"@ Wayne State";
	marker.map = mapView_;
	
	// Listen to the myLocation property of GMSMapView.
	[mapView_ addObserver:self
			   forKeyPath:@"myLocation"
				  options:NSKeyValueObservingOptionNew
				  context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context {
		CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
	
	NSLog(@"location changed, new location: lat:%f, long:%f", location.coordinate.latitude, location.coordinate.longitude);
}

/*
//location manager delegate methods
-(void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
	if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
		[locationManager startUpdatingLocation];
		
		mapView_.myLocationEnabled = YES;
		mapView_.settings.myLocationButton = YES;
	}
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
	CLLocation *currentLoc = locations.firstObject;
	
	if(currentLoc != nil) {
		mapView_.camera = [GMSCameraPosition cameraWithLatitude:currentLoc.coordinate.latitude
															longitude:currentLoc.coordinate.longitude
																 zoom:16];
	}
	
	[locationManager stopUpdatingLocation];
}


//gms delegate method
- (void)mapView:(GMSMapView *)mapView
didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
	NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
}
*/

@end
