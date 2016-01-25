//
//  ViewController.h
//  MapApp
//
//  Created by Jason Williams on 2016-01-25.
//  Copyright © 2016 Screaming Goat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    
    CLLocationManager *locationManager;
    
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;


- (IBAction)changeMap:(id)sender;
- (IBAction)LocateMe:(id)sender;

@end

