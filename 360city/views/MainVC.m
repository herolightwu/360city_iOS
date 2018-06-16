//
//  MainVC.m
//  360city
//
//  Created by meixiang wu on 2018/6/5.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import "MainVC.h"
#import "AppDelegate.h"
#import "Config.h"
#import "WebVC.h"
#import <MapKit/MapKit.h>
#import "InstructionVC.h"
#import "FullContentVC.h"

@interface MainVC ()<CLLocationManagerDelegate>{
    CLLocationManager *m_locationManager;
    CLLocationCoordinate2D mHomeCoordinate;
}
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    g_appDelegate.m_HomeVC = self;
    [g_appDelegate.m_mainVC showStatusBar];
    g_appDelegate.mSelView = MAIN_VIEW;
    self.navigationItem.title = @"360 Moscow";
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

- (IBAction)onMenuClick:(id)sender {
    [g_appDelegate.m_mainVC showLeftViewAnimated];
}

- (IBAction)onDemoClick:(id)sender {
    WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
    vc.mTitle = @"Free Demo";
    vc.mUrl = DEMO_LINK;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onContentClick:(id)sender {
    if([AppDelegate isPaidForBusiness]){
        WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
        vc.mTitle = @"Full Content";
        vc.mUrl = CONTENT_LINK;
        [self.navigationController pushViewController:vc animated:YES];
    } else{
        FullContentVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_FullContentVC"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)onHowToClick:(id)sender {
    WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
    vc.mTitle = @"How To Use";
    vc.mUrl = YOUTUBE_LINK;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onMapClick:(id)sender {
    WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
    vc.mTitle = @"Map";
    vc.mUrl = MAP_LIMK;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onMake3DClick:(id)sender {
    InstructionVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_InstructionVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onCommunityClick:(id)sender {
    WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
    vc.mTitle = @"Community";
    vc.mUrl = COMMUNITY_LINK;
    [vc setLayout];
    [self.navigationController pushViewController:vc animated:YES];
}
/*
- (void)openFacebookApp{
    // Check if FB app installed on device
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/355356557838717"]];
    }
    else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/360CityAndArt/"]];
    }
}

- (void)openInstagramApp{
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.instagram.com/360cityandart/"]];
    }
}

- (void)openStreetViewApp{
    NSString* scheme_url = [NSString stringWithFormat:@"https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=%f,%f&heading=-45&pitch=38&fov=80", mHomeCoordinate.latitude, mHomeCoordinate.longitude];
    //if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=48.857832,2.295226&heading=-45&pitch=38&fov=80"]]];
    //}
}*/

- (void)sendMail{
    NSString *emailTitle = @"Feedback For App";
    // Email Content
    NSString *messageBody = @""; // Change the message body to HTML
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"westlog.anrodev@gmail.com"];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self.navigationController presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
