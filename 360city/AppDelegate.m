//
//  AppDelegate.m
//  360city
//
//  Created by meixiang wu on 2018/6/5.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import "AppDelegate.h"
#import "MKStoreKit.h"
#import <StoreKit/StoreKit.h>
#import "Config.h"

@import Firebase;

@interface AppDelegate ()

@end

AppDelegate *g_appDelegate;

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    g_appDelegate = self;
    self.mSelView = 0;
    [FIRApp configure];
    
    // IAP_START
    [[MKStoreKit sharedKit] startProductRequest];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kMKStoreKitProductsAvailableNotification
                                                      object:nil
                                                       queue:[[NSOperationQueue alloc] init]
                                                  usingBlock:^(NSNotification *note) {
                                                      self.m_availableIAPProducts = [[MKStoreKit sharedKit] availableProducts];
                                                      NSLog(@"Products available: %@", self.m_availableIAPProducts);
                                                  }];
    /*[[NSNotificationCenter defaultCenter] addObserverForName:kMKStoreKitProductPurchasedNotification
                                                      object:nil
                                                       queue:[[NSOperationQueue alloc] init]
                                                  usingBlock:^(NSNotification *note) {
                                                      
                                                      NSLog(@"Purchased/Subscribed to product with id: %@", [note object]);
                                                  }];*/
    // IAP_END
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

+ (BOOL)hasAvailableBusinessIAPProducts
{
    BOOL hasBusinessListing = NO;
    
    for(SKProduct* product in g_appDelegate.m_availableIAPProducts) {
        if([product.productIdentifier isEqualToString:PRODUCT_ID_BUSINESS_LISTING]) {
            hasBusinessListing = YES;
        }
        
        if(hasBusinessListing) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)isPaidForBusiness
{
    /*if([AppDelegate hasAvailableBusinessIAPProducts]) {
        return YES;
    }*/
    //NSDate *expiryDateMonthly = [AppDelegate getExpiryDateForSubscriptionProduct:SUBSCRIPTION_ID_BUSINESS_LISTING_MONTHLY];
    BOOL isPaid = ([[MKStoreKit sharedKit] isProductPurchased:PRODUCT_ID_BUSINESS_LISTING]);
    
    if(isPaid) {
        return YES;
    }
    
    return NO;
}

@end
