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

- (void)eMailToAddress:(NSString *)toAddress cC:(NSString *)cC bCC:(NSString *)bCC messageSubject:(NSString *)messageSubject messageBody:(NSString *)messageBody
{
    NSString *compiledMailString = [NSString stringWithFormat:@"mailto:%@?cc=%@&bcc=%@&subject=%@&body=%@", toAddress, cC, bCC, messageSubject, messageBody];
    
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
