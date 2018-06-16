//
//  FullContentVC.h
//  360city
//
//  Created by meixiang wu on 2018/6/7.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface FullContentVC : UIViewController<MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *mPurchaseBtn;
- (IBAction)onPurchaseClick:(id)sender;
- (IBAction)onSendFeedback:(id)sender;

@end
