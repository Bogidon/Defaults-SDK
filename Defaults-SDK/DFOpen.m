//
//  DFOpen.m
//  
//
//  Created by Bogdan Vitoc on 9/4/15.
//
//

#import "DFOpen.h"
#import "Constants.h"
#import <UIKit/UIkit.h>

@implementation DFOpen

+ (BOOL)appExists {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString: AppBaseURL]];
}

+ (void)openURL:(NSString*)string {
    NSURL *url = [NSURL URLWithString:[self urlEncode:string]];
    if (![[UIApplication sharedApplication] openURL:url])
    {
        NSLog(@"%@%@",@"Failed to Open URL: ",[url description]);
    }
}

+ (NSString*)urlEncode:(NSString*)string {
    return string ? [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding] : @"";
}

# pragma mark - Navigation
+ (void)navigateToAddress:(NSString*)destinationAddress {
    [self navigateToAddress:destinationAddress startingAddress:nil];
}
+ (void)navigateToAddress:(NSString*)destinationAddress startingAddress:(NSString*)startingAddress; {
    // Make string URL-friendly
    address = [self urlEncode:address];

    // Create url string
    NSString *string;
    if ([DFOpen appExists]) {
        string = [NSString stringWithFormat:@"%@%@?daddr=%@&saddr=%@", AppBaseURL, AppNavigationDomain, destinationAddress, startingAddress];
    } else {
        string = [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@&saddr=%@", destinationAddress, startingAddresss];
    }
    
    // Open URL
    [DFOpen openURL:string];
}

# pragma mark - Mail
+ (void)mail:(NSString*)to {
    [self mail:to cc:nil bcc:nil subject:nil body:nil];
}
+ (void)mail:(NSString*)to cc:(NSString*)cc {
    [self mail:to cc:cc bcc:nil subject:nil body:nil];
}
+ (void)mail:(NSString*)to cc:(NSString*)cc bcc:(NSString*)bcc {
    [self mail:to cc:cc bcc:bcc subject:nil body:nil];
}
+ (void)mail:(NSString*)to cc:(NSString*)cc bcc:(NSString*)bcc subject:(NSString*)subject {
        [self mail:to cc:cc bcc:bcc subject:subject body:nil];
}
+ (void)mail:(NSString*)to cc:(NSString*)cc bcc:(NSString*)bcc subject:(NSString*)subject body:(NSString*)body
{
    // Make strings URL-friendly
    to = [self urlEncode:to];
    cc = [self urlEncode:cc];
    bcc = [self urlEncode:bcc];
    subject = [self urlEncode:subject];
    body = [self urlEncode:body];
    
    // Create url string
    NSString *string;
    if ([DFOpen appExists]) {
        string = [NSString stringWithFormat:@"%@%@?to=%@&cc=%@&bcc=%@&subject=%@&body=%@", AppBaseURL, AppMailDomain, to, cc, bcc, subject, body];
    } else {
        string = [NSString stringWithFormat: @"%@%@?cc=%@&bcc=%@&subject=%@&body=%@", MailtoBaseURL, to, cc, bcc, subject, body];
    }
    
    // Open URL
    [DFOpen openURL:string];
}

# pragma mark - Browser
+ (void)browser:(NSString *)inputURL
{
    // Make string URL-friendly
    inputURL = [self urlEncode:inputURL];
    
    // Create url string
    NSString *string;
    if ([DFOpen appExists]) {
        string = [NSString stringWithFormat:@"%@%@?url=%@", AppBaseURL, AppBrowserDomain, inputURL];
    } else {
        string = inputURL;
    }
    
    // Open url
    [DFOpen openURL:string];
}

@end
