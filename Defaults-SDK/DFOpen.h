//
//  DFOpen.h
//  
//
//  Created by Bogdan Vitoc on 9/4/15.
//
//

#import <Foundation/Foundation.h>

@interface DFOpen : NSObject

# pragma mark - Navigation
+ (void)showAddress:(NSString*)address;
+ (void)navigateToAddress:(NSString*)toAddress fromAddress:(NSString*)fromAddress;

# pragma mark - Mail
+ (void)mail:(NSString*)to;
+ (void)mail:(NSString*)to cc:(NSString*)cc;
+ (void)mail:(NSString*)to cc:(NSString*)cc bcc:(NSString*)bcc;
+ (void)mail:(NSString*)to cc:(NSString*)cc bcc:(NSString*)bcc subject:(NSString*)subject;
+ (void)mail:(NSString*)to cc:(NSString*)cc bcc:(NSString*)bcc subject:(NSString*)subject body:(NSString*)body;

# pragma mark - Browser
+ (void)browser:(NSString *)inputURL;

@end
