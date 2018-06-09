//
//  SlideMenuView.h
//
//
//  Created by meixiang wu on 6/15/17.
//  Copyright © 2017 meixiang wu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LeftSlideMenuView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *mUsername;
@property (weak, nonatomic) IBOutlet UILabel *mEmail;


- (IBAction)onRegister:(id)sender;
- (IBAction)onFeedback:(id)sender;
- (IBAction)onAddLink1:(id)sender;
- (IBAction)onAddLink2:(id)sender;
- (IBAction)onFindFacebook:(id)sender;
- (IBAction)onFindInstagram:(id)sender;


- (void)setLayout;
@end
