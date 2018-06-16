//
//  MainVC.h
//  360city
//
//  Created by meixiang wu on 2018/6/5.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MainVC : UIViewController<MFMailComposeViewControllerDelegate>


- (IBAction)onMenuClick:(id)sender;
- (IBAction)onDemoClick:(id)sender;
- (IBAction)onContentClick:(id)sender;
- (IBAction)onHowToClick:(id)sender;
- (IBAction)onMapClick:(id)sender;
- (IBAction)onMake3DClick:(id)sender;
- (IBAction)onCommunityClick:(id)sender;

- (void)sendMail;
//- (void)openStreetViewApp;
//- (void)openFacebookApp;
//- (void)openInstagramApp;

@end
