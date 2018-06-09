//
//  InstructionVC.m
//  360city
//
//  Created by meixiang wu on 2018/6/7.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import "InstructionVC.h"
#import <MapKit/MapKit.h>

@interface InstructionVC ()<CLLocationManagerDelegate>{
    CLLocationManager *m_locationManager;
    CLLocationCoordinate2D mHomeCoordinate;
}

@end

@implementation InstructionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Instruction";
    
    mHomeCoordinate.latitude = 46.414382;
    mHomeCoordinate.longitude = 10.013988;
    // Start getting current location
    m_locationManager = [[CLLocationManager alloc] init];
    m_locationManager.delegate = self;
    m_locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    m_locationManager.distanceFilter = kCLDistanceFilterNone;//100;
    if([m_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [m_locationManager requestWhenInUseAuthorization];
    }
    [m_locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LOCATION MANAGER

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    mHomeCoordinate = location.coordinate;
    //   [m_locationManager stopUpdatingLocation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onLunchStreetApp:(id)sender {
    [self openStreetViewApp];
}

- (void)openStreetViewApp{
    
    NSString* scheme_url = [NSString stringWithFormat:@"https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=%f,%f&heading=-45&pitch=38&fov=80", mHomeCoordinate.latitude, mHomeCoordinate.longitude];
    //if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:scheme_url]]];
    //}
    
}

- (void) showAlertView:(NSString*)title
               Message:(NSString*)msg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                           NSLog(@"You pressed button one");
                                                       }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
