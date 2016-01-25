//
//  ViewController.m
//  MapApp
//
//  Created by Jason Williams on 2016-01-25.
//  Copyright © 2016 Screaming Goat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMap:(id)sender {
    
    if (self.segmentControl.selectedSegmentIndex == 0) {
        self.mapView.mapType = MKMapTypeStandard;
    }
    if (self.segmentControl.selectedSegmentIndex == 1) {
        self.mapView.mapType = MKMapTypeSatellite;
    }
    if (self.segmentControl.selectedSegmentIndex == 2) {
        self.mapView.mapType = MKMapTypeHybrid;
    }
}

- (IBAction)LocateMe:(id)sender {
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    
}
@end
