//
//  GSSlideMenuController.m
//  GSSlideMenu
//
//  Created by Giacomo Saccardo on 22/03/12.
//  Copyright (c) 2012 Giacomo Saccardo. All rights reserved.
//

#import "GSSlideMenuController.h"
#import "BackView.h"
#import "FrontView.h"

@interface GSSlideMenuController ()

@end

@implementation GSSlideMenuController
@synthesize back = _back;
@synthesize front = _front;
@synthesize isRevealed;
@synthesize backURL = _backURL;
@synthesize frontStartURL = _frontStartURL;
@synthesize termToShowMenu = _termToShowMenu;

- (void)dealloc
{
    [_front release];
    [_back release];
    [_backURL release];
    [_frontStartURL release];
    [_termToShowMenu release];
    [super dealloc];
}

-(id)initWithBackViewURL:(NSURL *)backURL andFrontViewURL:(NSURL *)frontURL andTermToShowMenu:(NSString *)term{
    self = [super init];
    if (self) {
        
        self.backURL = backURL;
        self.frontStartURL = frontURL;
        self.termToShowMenu = term;
        self.isRevealed = NO;
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            self.back = [[BackView alloc] initWithNibName:@"BackView_iPhone"
                                 andGSSlideMenuController:self 
                                                   bundle:nil];
            self.front = [[FrontView alloc] initWithNibName:@"FrontView_iPhone" 
                                   andGSSlideMenuController:self 
                                                     bundle:nil];
        }
        else {
            self.back = [[BackView alloc] initWithNibName:@"BackView_iPad"
                                 andGSSlideMenuController:self 
                                                   bundle:nil];
            self.front = [[FrontView alloc] initWithNibName:@"FrontView_iPad" 
                                   andGSSlideMenuController:self 
                                                     bundle:nil];
        }
        [self.view addSubview:self.back.view];
        [self.view addSubview:self.front.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_front release];
    _front = nil;
    [_back release];
    _back = nil;
    [_backURL release];
    _backURL = nil;
    [_frontStartURL release];
    _frontStartURL = nil;
    [_termToShowMenu release];
    _termToShowMenu = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Menu methods

-(void)moveMenu{
    CGRect destination = self.front.view.frame;
    
    if (destination.origin.x > 0) {
        destination.origin.x = 0;
        isRevealed = NO;
    } else {
        destination.origin.x += 254.5;
        isRevealed = YES;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.front.view.frame = destination;        
        
    } completion:^(BOOL finished) {
                
    }];
}

-(void)loadURLinFrontView:(NSURL *)url{
    [self.front loadURL:url];
    [self moveMenu];
}

@end
