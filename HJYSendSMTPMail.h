//
//  HJYSendSMTPMail.h
//  SMTPAddDelegate
//
//  Created by jy-hu on 14-5-30.
//  Copyright (c) 2014年 JinyouHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMTPSendMail/SKPSMTPMessage.h"

@interface HJYSendSMTPMail : NSObject

+ (SKPSMTPMessage *)sendMailTo:(NSString *)mailText;

@end
