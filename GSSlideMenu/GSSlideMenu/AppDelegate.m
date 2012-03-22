//
//  AppDelegate.m
//  GSSlideMenu
//
//  Created by Giacomo Saccardo on 22/03/12.
//  Copyright (c) 2012 Giacomo Saccardo. All rights reserved.
//

#import "AppDelegate.h"

#import "GSSlideMenuController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize gsslidemenu = _gsslidemenu;

- (void)dealloc
{
    [_window release];
    [_gsslidemenu release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    NSURL *backView_url = [NSURL URLWithString:@"http://www.giacomosaccardo.com/GitHub/GSSlideMenu/backMenu.html"];
    NSURL *frontView_start_url = [NSURL URLWithString:@"http://www.giacomosaccardo.com/GitHub/GSSlideMenu/frontMenu.html"];
    NSString *term_to_show_menu = [NSString stringWithFormat:@"open_back_menu"];
    
    self.gsslidemenu = [[GSSlideMenuController alloc] initWithBackViewURL:backView_url 
                                                          andFrontViewURL:frontView_start_url 
                                                       andTermiToShowMenu:term_to_show_menu];
    
   
    self.window.rootViewController = self.gsslidemenu;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
