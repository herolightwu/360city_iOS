//
//  Config.h
//  Foods
//
//  Created by Jin_Q on 3/17/16.
//  Copyright © 2016 Jin_Q. All rights reserved.
//

#import <UIKit/UIKit.h>

//======define Keys =================

//=================color ======================================
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 120.0) blue:((b) / 50.0) alpha:1.0]
#define PRIMARY_COLOR  [UIColor colorWithRed:(241.0/255.0) green:(104.0/255.0) blue:(88.0/255.0) alpha:1.0]
#define WHITE_COLOR  [UIColor colorWithRed:(1.0) green:(1.0) blue:(1.0) alpha:1.0]
#define CONTROLL_EDGE_COLOR  [UIColor colorWithRed:(0.3) green:(0.3) blue:(0.3) alpha:0.2]
#define PRIMARY_TEXT_COLOR [UIColor colorWithRed:(0.0/255.0) green:(128.0/255.0) blue:(255.0/255.0) alpha:1.0]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//view status
#define MAIN_VIEW 1
#define VIDEO_VIEW 2
#define FORUM_VIEW 3

#define DEMO_LINK @"https://dsmartscoutdemo.appspot.com/"
#define CONTENT_LINK @"https://dsmartscout.appspot.com/"
#define YOUTUBE_LINK @"https://youtu.be/5NoDfAAZtIA"
#define MAP_LIMK @"https://www.google.com/maps/"
#define THREE_PHOTO_LINK @"https://www.google.com/maps/@37.779488,-122.4200781,3a,75y,344.8h,105.05t/data=!3m6!1e1!3m4!1swjq9r1JmjXTM2-vCw6B2iQ!2e0!7i13312!8i6656"
#define COMMUNITY_LINK @"https://www.facebook.com/360CityAndArt/"
#define FACEBOOK_LINK @"https://www.facebook.com/360CityAndArt/"
#define INSTAGRAM_LINK @"https://www.instagram.com/360cityandart/"

// Subscription ID
#define PRODUCT_ID_BUSINESS_LISTING        @"full360contentmoscow"
// IAP Type
#define IAP_TYPE_BUSINESS   @"business"
