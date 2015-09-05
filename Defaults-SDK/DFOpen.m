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

- (void)mail:(NSString*)to cC:(NSString*)cC bCC:(NSString*)bCC subject:(NSString*)subject body:(NSString*)body
{
    NSString *compiledMailString = [NSString stringWithFormat:@"comdefaults:%@?cc=%@&bcc=%@&subject=%@&body=%@", to, cC, bCC, subject, body];
    
    NSURL *urlFromString = [NSURL URLWithString:compiledMailString];
    
    if (![[UIApplication sharedApplication] openURL:urlFromString])
    {
        NSLog(@"%@%@",@"Failed to Open URL: ",[urlFromString description]);
    }
}

- (void)openURL:(NSString *)urlToOpen
{
    NSURL *urlFromString = [NSURL URLWithString:urlToOpen];
    
    if (![[UIApplication sharedApplication] openURL:urlFromString])
    {
        NSLog(@"%@%@",@"Failed to Open URL: ",[urlFromString description]);
    }
}

@end
