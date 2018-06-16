//
//  SignupVC.h
//  360city
//
//  Created by meixiang wu on 2018/6/7.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MaterialTextField/MaterialTextField.h>
@import Firebase;

@interface SignupVC : UIViewController
@property (weak, nonatomic) IBOutlet MFTextField *mUsername;
@property (weak, nonatomic) IBOutlet MFTextField *mEmail;
@property (weak, nonatomic) IBOutlet MFTextField *mPassword;
@property (weak, nonatomic) IBOutlet MFTextField *mConfirm;

- (IBAction)onRegister:(id)sender;

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end
