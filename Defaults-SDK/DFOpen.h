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
- (void)eMailToAddress:(NSString*)toAddress cC:(NSString*)cC bCC:(NSString*)bCC messageSubject:(NSString*)messageSubject messageBody:(NSString*)messageBody;

# pragma mark - Browser
- (void)openURL:(NSString*)urlToOpen;

@end
