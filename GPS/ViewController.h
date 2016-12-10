//
//  ViewController.h
//  GPS
//
//  Created by Student on 14/11/16.
//  Copyright (c) 2016 Abhijit.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapview;
@property(nonatomic,retain)CLLocationManager *manager;
@property(nonatomic,retain)CLGeocoder *geocoder;


@end

