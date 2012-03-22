//
//  GSSlideMenuController.h
//  GSSlideMenu
//
//  Created by Giacomo Saccardo on 22/03/12.
//  Copyright (c) 2012 Giacomo Saccardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BackView;
@class FrontView;

@interface GSSlideMenuController : UIViewController 

@property (strong, nonatomic) BackView *back;
@property (strong, nonatomic) FrontView *front;
@property (nonatomic) BOOL isRevealed;
@property (strong, nonatomic) NSURL *backURL;
@property (strong, nonatomic) NSURL *frontStartURL;
@property (strong, nonatomic) NSString *termToShowMenu;

-(id)initWithBackViewURL:(NSURL *)backURL andFrontViewURL:(NSURL *)frontURL andTermiToShowMenu:(NSString *)term;

-(void)moveMenu;
-(void)loadURLinFrontView:(NSURL *)url;

@end
