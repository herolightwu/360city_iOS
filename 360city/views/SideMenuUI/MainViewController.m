//
//  MainViewController.m
//  LGSideMenuControllerDemo
//

#import "MainViewController.h"
#import "AppDelegate.h"

@interface MainViewController () <LGSideMenuDelegate>
{
    BOOL m_hideStatusBar;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    self.leftViewWidth = self.view.frame.size.width * 3 / 4;
    
    m_hideStatusBar = NO;
}

- (void) viewWillAppear:(BOOL)animated {
    g_appDelegate.m_mainVC = self;
    g_appDelegate.mSelView = 0;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return m_hideStatusBar;
}

- (BOOL)hasStatusBar
{
    return !m_hideStatusBar;
}

- (void)showStatusBar
{
    m_hideStatusBar = NO;
    [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
}

- (void)hideStatusBar
{
    m_hideStatusBar = YES;
    [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
}

- (void)willShowLeftView:(nonnull UIView *)leftView sideMenuController:(nonnull LGSideMenuController *)sideMenuController
{
    [self hideStatusBar];
    [g_appDelegate.m_sidebarVC setLayout];
}

- (void)willHideLeftView:(nonnull UIView *)leftView sideMenuController:(nonnull LGSideMenuController *)sideMenuController
{
    [self showStatusBar];
}

@end
