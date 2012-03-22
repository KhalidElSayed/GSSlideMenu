//
//  BackView.m
//  GSSlideMenu
//
//  Created by Giacomo Saccardo on 22/03/12.
//  Copyright (c) 2012 Giacomo Saccardo. All rights reserved.
//

#import "BackView.h"
#import "GSSlideMenuController.h"
@interface BackView ()

@end

@implementation BackView

-(void)dealloc{
    [back_webview release];
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
    
	NSURLRequest* request = [NSURLRequest requestWithURL:menu.backURL];
	[back_webview loadRequest:request];
}

- (void)viewDidUnload
{
    [back_webview release];
    back_webview = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIWebView delegate methods

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
          
     NSString *requestString = [[request URL] absoluteString];
     NSString *str_backURL = [NSString stringWithFormat:@"%@", menu.backURL];
     
     if ([requestString isEqualToString:str_backURL]) {
        return YES;
     }
    
    [menu loadURLinFrontView:[[request URL] absoluteURL]];
    
	return NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
	NSLog(@"Error loading: %@", error);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	//NSLog(@"Finish loading");	
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
	//NSLog(@"Start load");
}

@end
