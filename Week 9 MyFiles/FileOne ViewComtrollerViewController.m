//
//  FileOne ViewComtrollerViewController.m
//  MyFiles
//
//  Created by Todd Claussen on 3/24/14.
//  Copyright (c) 2014 RVC Student. All rights reserved.
//

#import "FileOne ViewComtrollerViewController.h"

@interface FileOne_ViewComtrollerViewController ()

@end

@implementation FileOne_ViewComtrollerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadexternalFile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_Webview release];
    [super dealloc];
}
- (void)loadexternalFile
{
    //check if connect to internet before external URL
    if([self checkinternet] == NO)
    {
        // Not connected to the internet
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Internet Connection Required"
                                                          message:@"Close app and return when internet connection available."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        //check if iphone or ipad
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            //get screen size
            CGSize size = [self getScreenSize];
            
            //set size
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, size.width, size.height-100)];
            
            NSURL *targetURL = [NSURL URLWithString:@"http://www.nytimes.com"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            [webView loadRequest:request];
            
            //load file in to webview
            [self.view addSubview:webView];
            [webView release];
            
        }
        
        else {
            //get screen size
            CGSize size = [self getScreenSize];
            
            //set size
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, size.width, size.height-100)];
            
            NSURL *targetURL = [NSURL URLWithString:@"http://www.nytimes.com"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            [webView loadRequest:request];
            
            //load file in to webview
            [self.view addSubview:webView];
            [webView release];
            
        }
        
        
    }
    
    
    
}

- (CGSize)getScreenSize
{
    //Get Screen size
    CGSize size;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
        // in Landscape mode, width always higher than height
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height < [[UIScreen mainScreen] bounds].size.width) {
        // in Portrait mode, height always higher than width
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else {
        // otherwise it is normal
        size.height = [[UIScreen mainScreen] bounds].size.height;
        size.width = [[UIScreen mainScreen] bounds].size.width;
    }
    return size;
}
- (BOOL) checkinternet
{
    //check internet connection
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }
    else
    {
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
}
@end
