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
    NSURL *url = [NSURL URLWithString:string];
    if (![[UIApplication sharedApplication] openURL:url])
    {
        NSLog(@"%@%@",@"Failed to Open URL: ",[url description]);
    }
}

- (void)mail:(NSString*)to cc:(NSString*)cc bcc:(NSString*)bcc subject:(NSString*)subject body:(NSString*)body
{
    // Make strings URL-friendly
    to = [to stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    cc = [cc stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    bcc = [bcc stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    subject = [subject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    body = [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
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

- (void)openURL:(NSString *)inputURL
{
    NSString *string;
    if ([DFOpen appExists]) {
        string = [NSString stringWithFormat:@"%@%@?url=%@", AppBaseURL, AppBrowserDomain, inputURL];
    } else {
        string = inputURL;
    }
    
    NSURL *url = [NSURL URLWithString:string];
    
    if (![[UIApplication sharedApplication] openURL:url])
    {
        NSLog(@"%@%@",@"Failed to Open URL: ",[url description]);
    }
}

@end
