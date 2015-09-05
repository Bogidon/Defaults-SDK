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
- (void)showAddress:(NSString*)address;
- (void)navigateToAddress:(NSString*)toAddress fromAddress:(NSString*)fromAddress;

# pragma mark - Mail
- (void)email:(NSString*)email;
- (void)email:(NSString*)email subject:(NSString*) subject;

# pragma mark - Browser
- (void)openURL:(NSString*)url;

@end