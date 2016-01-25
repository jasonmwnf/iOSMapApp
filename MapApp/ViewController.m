//
//  ViewController.m
//  MapApp
//
//  Created by Jason Williams on 2016-01-25.
//  Copyright © 2016 Screaming Goat. All rights reserved.
//

#import "ViewController.h"
#import "MapPin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = 47.5605413;
    region.center.longitude = -52.71283149999999;
    region.span.latitudeDelta = 0.01f;
    region.span.longitudeDelta = 0.01f;
    [self.mapView setRegion:region animated:YES];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.title = @"St.John's";
    ann.subtitle = @"Newfoundland";
    ann.coordinate = region.center;
    [self.mapView addAnnotation:ann];
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

- (IBAction)Route:(id)sender {
    
    NSString *urlstring = @"http://maps.apple.com/maps?daddr=47.5605413,-52.71283149999999";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlstring]];
    
}
@end
