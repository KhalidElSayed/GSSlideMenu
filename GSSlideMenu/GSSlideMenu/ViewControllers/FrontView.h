//
//  FrontView.h
//  GSSlideMenu
//
//  Created by Giacomo Saccardo on 22/03/12.
//  Copyright (c) 2012 Giacomo Saccardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GSSlideMenuController;

@interface FrontView : UIViewController {
    GSSlideMenuController *menu;
    IBOutlet UIWebView *front_webview;
}

- (id)initWithNibName:(NSString *)nibNameOrNil andGSSlideMenuController:(GSSlideMenuController *)GSmenu bundle:(NSBundle *)nibBundleOrNil;
-(void)loadURL:(NSURL *)url;

@end
