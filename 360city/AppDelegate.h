//
//  AppDelegate.h
//  360city
//
//  Created by meixiang wu on 2018/6/5.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "LeftSlideMenuView.h"
#import "MainVC.h"

@class AppDelegate;

extern AppDelegate *g_appDelegate;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *m_mainVC;
@property (strong, nonatomic) LeftSlideMenuView *m_sidebarVC;
@property (strong, nonatomic) MainVC *m_HomeVC;

@property (nonatomic) NSInteger mSelView;

@property (nonatomic) BOOL bPaid;
// IAP
@property (strong, nonatomic) NSArray *m_availableIAPProducts;

+ (BOOL)isPaidForBusiness;

@end

