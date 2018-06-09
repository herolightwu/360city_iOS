//
//  FullContentVC.m
//  360city
//
//  Created by meixiang wu on 2018/6/7.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import "FullContentVC.h"
#import "MKStoreKit.h"
#import "AppDelegate.h"
#import "Config.h"
#import "WebVC.h"

@interface FullContentVC ()

@end

@implementation FullContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Full Content";
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotificationForProductPurchased:)
                                                 name:kMKStoreKitProductPurchasedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotificationForProductPurchaseFailed:)
                                                 name:kMKStoreKitProductPurchaseFailedNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if([AppDelegate isPaidForBusiness]){
        [self.mPurchaseBtn setEnabled:NO];
    } else{
        [self.mPurchaseBtn setEnabled:YES];
    }
}

- (void)receiveNotificationForProductPurchased:(NSNotification *)notification
{
    //NSLog(@"Purchased/Subscribed to product with id: %@", notification.object);
    NSString *msgstr = [NSString stringWithFormat:@"Purchased/Subscribed to product with id: %@", notification.object];
    //[self showAlertView:@"Alert" Message:msgstr];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:msgstr
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                           WebVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SID_WebVC"];
                                                           vc.mTitle = @"Full Content";
                                                           vc.mUrl = CONTENT_LINK;
                                                           [self.navigationController pushViewController:vc animated:YES];
                                                       }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    g_appDelegate.bPaid = true;
    //[self.navigationController popViewControllerAnimated:YES];
}

- (void)receiveNotificationForProductPurchaseFailed:(NSNotification *)notification
{
    //NSLog(@"Purchase/Subscribe failed to product with id: %@", notification.object);
    NSString *errorstr = [NSString stringWithFormat:@"Purchase/Subscribe failed to product with id: %@", notification.object];
    [self showAlertView:@"Warning" Message:errorstr];
    g_appDelegate.bPaid = false;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onPurchaseClick:(id)sender {
    [[MKStoreKit sharedKit] initiatePaymentRequestForProductWithIdentifier:PRODUCT_ID_BUSINESS_LISTING];
}

- (IBAction)onSendFeedback:(id)sender {
    [self sendMail];
}

- (void)sendMail{
    NSString *emailTitle = @"Feedback For Full Content";
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
