# ADBImageView

With GSSlideMenu you can easily create a web-based menu like that one present in the Facebook app.
Web-based because you can set an UIWebView also for the "back" menu; GSSlideMenu intercepts all the links and it opens the webpage in the main UIWebView.

How to use it
-----

- Import GSSlideMenuController, BackView and FrontView classes.
- In your AppDelegate import GSSlideMenuController.h and, in you didFinishLaunchingWithOptions method write - these lines:

``` objective-c	
	NSURL *backView_url = [NSURL URLWithString:@"http://www.your_domain.com/url_for_backMenu.html"];
	NSURL *frontView_start_url = [NSURL URLWithString:@"http://www.your_domain.com/url_for_frontMenu.html"];
	NSString *term_to_show_menu = [NSString stringWithFormat:@"open_back_menu"];
    
	GSSlideMenuController *gsslidemenu = [[GSSlideMenuController alloc] initWithBackViewURL:backView_url 
                                                      	  andFrontViewURL:frontView_start_url 
                                                       andTermToShowMenu:term_to_show_menu];
   
	self.window.rootViewController = self.gsslidemenu;
	[self.window makeKeyAndVisible];
``` 

The NSString `term_to_show_menu` is a string which the FrontView detects and uses it in order to open the menu.
In your html file you should write 
``` 
	<a href="string_used_in_term_to_show_menu">Menu</a>
```

otherwise the UIWebView will open the link in the FrontView.

The GSSLideMenuController class methods are:

- -(void)moveMenu;

This method open or close the menu.

- -(void)loadURLinFrontView:(NSURL *)url;

This method open a URL in the FrontView.

A boolean variable `isRevealed` is TRUE if the menu is revealed, otherwise is FALSE.