//
//  ViewController.m
//  GPS
//
//  Created by Student on 14/11/16.
//  Copyright (c) 2016 Abhijit.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _manager=[[CLLocationManager alloc]init];
    _manager.desiredAccuracy=kCLLocationAccuracyBest;
    _manager.delegate=self;
    
    [_manager startUpdatingLocation];
  
    _geocoder=[[CLGeocoder alloc]init];
    
    /////////************
    
    
  //  _geocoder=[[CLGeocoder alloc]init];
    NSString *address=@"Kothrud , Pune, Maharashtra, India, 411038";

[_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
    CLPlacemark *mylatlong=[placemarks objectAtIndex:0];
    CLLocation *location=mylatlong.location;
    NSLog(@"%f   %f",location.coordinate.latitude,location.coordinate.longitude);
    
}];

}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *mycurrentlocation=[locations lastObject];
    [_geocoder reverseGeocodeLocation:mycurrentlocation completionHandler:^(NSArray *placemarks, NSError *error) {
       
        CLPlacemark *mylocationinfo=[placemarks objectAtIndex:0];
        MKPointAnnotation *point1=[[MKPointAnnotation alloc]init];
        point1.title=mylocationinfo.locality;
        point1.subtitle=mylocationinfo.postalCode;
        
        CLLocationCoordinate2D loc;
        loc.latitude=mycurrentlocation.coordinate.latitude;
        loc.longitude=mycurrentlocation.coordinate.longitude;
        point1.coordinate=loc;
        [self.mapview addAnnotation:point1];
        
    }];
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
