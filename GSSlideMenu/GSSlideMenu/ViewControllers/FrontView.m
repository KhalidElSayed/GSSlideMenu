//
//  FrontView.m
//  GSSlideMenu
//
//  Created by Giacomo Saccardo on 22/03/12.
//  Copyright (c) 2012 Giacomo Saccardo. All rights reserved.
//

#import "FrontView.h"
#import "GSSlideMenuController.h"

@interface FrontView ()

@end

@implementation FrontView

-(void)dealloc{
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil andGSSlideMenuController:(GSSlideMenuController *)GSmenu bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        menu = GSmenu;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:menu.frontStartURL];
	[front_webview loadRequest:request];
    
    //gesture for Swipe
    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(disappearMenu)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer release];
      
    [super viewDidLoad];
    
}

-(void)disappearMenu {
    [menu moveMenu];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIWebView delegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
        
    NSRange textRange =[[[[request URL] absoluteString] lowercaseString] rangeOfString:[menu.termToShowMenu lowercaseString]];
    
    if(textRange.location != NSNotFound)
    {
        [menu moveMenu];
        return NO;
    }

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
	NSLog(@"Error loading: %@", error);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	//NSLog(@"Finish loading");	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
	//NSLog(@"Start load");
}

-(void)loadURL:(NSURL *)url{
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
	[front_webview loadRequest:request];
}

@end
