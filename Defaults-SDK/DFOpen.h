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
- (void)mail:(NSString*)to;
- (void)mail:(NSString*)to cC:(NSString*)cC bCC:(NSString*)bCC subject:(NSString*)subject body:(NSString*)body;

# pragma mark - Browser
- (void)openURL:(NSString*)urlToOpen;

@end
