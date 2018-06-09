//
//  SlideMenuView.m
//
//  Created by meixiang wu on 6/15/17.
//  Copyright © 2017 meixiang wu. All rights reserved.
//

#import "LeftSlideMenuView.h"
#import "AppDelegate.h"
#import "UIViewController+LGSideMenuController.h"
#import "MainViewController.h"
#import "Config.h"
#import "WebVC.h"
#import "SignupVC.h"
#import "InstructionVC.h"
#import "Common.h"

@interface LeftSlideMenuView (){
    MainViewController *mainViewController;
}

@end

@implementation LeftSlideMenuView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //CALayer *imageLayer = self.mImageView.layer;
    //[imageLayer setCornerRadius:64];
    //[imageLayer setBorderWidth:1];
    //[imageLayer setMasksToBounds:YES];
    //[imageLayer setBorderColor:CONTROLL_EDGE_COLOR.CGColor];
    [self setLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

- (void) viewWillAppear:(BOOL)animated {
    g_appDelegate.m_sidebarVC = self;
    [self setLayout];
}

/*
- (IBAction)onVideoClick:(id)sender {
    if(mainViewController == nil) mainViewController = (MainViewController *)self.sideMenuController;
    if(g_appDelegate.mSelView != VIDEO_VIEW){
        if(g_appDelegate.mSelView != HOME_VIEW) // no dashboard
            [g_appDelegate.m_DashboardVC.navigationController popViewControllerAnimated:NO];
        VideoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_VideoViewController"];
        [g_appDelegate.m_DashboardVC.navigationController pushViewController:vc animated:YES];
    }
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}
*/

- (IBAction)onRegister:(id)sender {
    if(mainViewController == nil) mainViewController = (MainViewController *)self.sideMenuController;
    SignupVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_SignupVC"];
    [g_appDelegate.m_HomeVC.navigationController pushViewController:vc animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}

- (IBAction)onFeedback:(id)sender {
    if(mainViewController == nil) mainViewController = (MainViewController *)self.sideMenuController;
    
    [g_appDelegate.m_HomeVC sendMail];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}

- (IBAction)onAddLink1:(id)sender {
    if(mainViewController == nil) mainViewController = (MainViewController *)self.sideMenuController;
    WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
    vc.mTitle = @"Map";
    vc.mUrl = MAP_LIMK;
    [g_appDelegate.m_HomeVC.navigationController pushViewController:vc animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}

- (IBAction)onAddLink2:(id)sender {
    if(mainViewController == nil) mainViewController = (MainViewController *)self.sideMenuController;
    InstructionVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_InstructionVC"];
    [g_appDelegate.m_HomeVC.navigationController pushViewController:vc animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}

- (IBAction)onFindFacebook:(id)sender {
    //[g_appDelegate.m_HomeVC openFacebookApp];
    if(mainViewController == nil) mainViewController = (MainViewController *)self.sideMenuController;
    WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
    vc.mTitle = @"Facebook";
    vc.mUrl = FACEBOOK_LINK;
    [g_appDelegate.m_HomeVC.navigationController pushViewController:vc animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}

- (IBAction)onFindInstagram:(id)sender {
    //[g_appDelegate.m_HomeVC openInstagramApp];
    if(mainViewController == nil) mainViewController = (MainViewController *)self.sideMenuController;
    WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
    vc.mTitle = @"Instagram";
    vc.mUrl = INSTAGRAM_LINK;
    [g_appDelegate.m_HomeVC.navigationController pushViewController:vc animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}

- (void)setLayout{
    NSString *uname = [Common getValueKey:@"moscow-username"];
    NSString *uemail = [Common getValueKey:@"moscow-email"];
    if(uname != nil){
        self.mUsername.text = uname;
    }
    if(uemail != nil){
        self.mEmail.text = uemail;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
