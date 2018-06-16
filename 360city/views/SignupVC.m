//
//  SignupVC.m
//  360city
//
//  Created by meixiang wu on 2018/6/7.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import "SignupVC.h"
#import "Common.h"

@interface SignupVC ()

@end

NSString *const MFDemoErrorDomain = @"MFDemoErrorDomain";
NSInteger const MFDemoErrorCode = 100;

@implementation SignupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ref = [[FIRDatabase database] reference];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Register";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onRegister:(id)sender {
    if(![self vaildFields]){
        return;
    }
    [self registerUser];
}

- (void)registerUser{
    
    NSString *uname = self.mUsername.text;
    NSString *uemail = self.mEmail.text;
    NSString *upass = self.mPassword.text;
    [[[[self.ref child:@"Users"] queryOrderedByChild:@"email"] queryEqualToValue:uemail] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *_Nonnull snapshot) {
        if([snapshot childrenCount] == 0){
            NSDictionary *dicParams = @{
                                        @"username":uname,
                                        @"email":uemail,
                                        @"password":upass,
                                        };
            NSString *uid = [[[self.ref child:@"Users"] childByAutoId] key];
            [[[self.ref child:@"Users"] child:uid] setValue:dicParams];
            [self showAlertView:@"Alert!" Message:@"User was registered successfully."];
            [Common saveValueKey:@"moscow-username" Value:uname];
            [Common saveValueKey:@"moscow-email" Value:uemail];
            [self.navigationController popViewControllerAnimated:YES];
        } else{
            [self showAlertView:@"Warning!" Message:@"User email is exist."];
        }
    }];
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

- (BOOL)vaildFields{
    if([self.mUsername.text length]==0){
        [self.mUsername setError:[self errorWithLocalizedDescription:@"Enter your username"] animated:YES];
        return NO;
    }
    if([self.mPassword.text length]==0){
        [self.mPassword setError:[self errorWithLocalizedDescription:@"Enter your password and try again."] animated:YES];
        return NO;
    }
    if([self.mEmail.text length]==0){
        [self.mEmail setError:[self errorWithLocalizedDescription:@"Type your email address."] animated:YES];
        return NO;
    }
    if(![Common NSStringIsValidEmail:self.mEmail.text]){
        [self.mEmail setError:[self errorWithLocalizedDescription:@"Incorrect email address."] animated:YES];
        return NO;
    }
    if(![self.mPassword.text isEqualToString:self.mConfirm.text]){
        [self.mPassword setError:[self errorWithLocalizedDescription:@"Incorrect confirm password"] animated:YES];
        return NO;
    }
    return YES;
}

- (NSError *)errorWithLocalizedDescription:(NSString *)localizedDescription
{
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: localizedDescription};
    return [NSError errorWithDomain:MFDemoErrorDomain code:MFDemoErrorCode userInfo:userInfo];
}
@end
