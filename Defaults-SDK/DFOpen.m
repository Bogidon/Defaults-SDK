//
//  DFOpen.m
//  
//
//  Created by Bogdan Vitoc on 9/4/15.
//
//

#import "DFOpen.h"
#import <UIKit/UIkit.h>

@implementation DFOpen

+ (BOOL)appExists {
    return NO;
}

- (void)mail:(NSString*)to cC:(NSString*)cC bCC:(NSString*)bCC subject:(NSString*)subject body:(NSString*)body
{
    NSString *string;
    if ([DFOpen appExists]) {
        string = [NSString stringWithFormat:@"comdefaults://mail?to=%@&cc=%@&bcc=%@&subject=%@&body=%@", to, cC, bCC, subject, body];
    } else {
        string = @"";
    }
    
    NSURL *url = [NSURL URLWithString:string];
    
    if (![[UIApplication sharedApplication] openURL:url])
    {
        NSLog(@"%@%@",@"Failed to Open URL: ",[url description]);
    }
}

- (void)openURL:(NSString *)inputURL
{
    NSString *string;
    if ([DFOpen appExists]) {
        string = [NSString stringWithFormat:@"comdefaults://browser?url=%@", inputURL];
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
