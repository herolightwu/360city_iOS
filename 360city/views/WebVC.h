//
//  WebVC.h
//  360city
//
//  Created by meixiang wu on 2018/6/5.
//  Copyright © 2018 meixiang wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebVC : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *mWebView;

@property (nonatomic) NSString* mTitle;
@property (nonatomic) NSString* mUrl;

- (void)setLayout;
@end
