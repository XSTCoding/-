//
//  HJYSendSMTPMail.m
//  SMTPAddDelegate
//
//  Created by jy-hu on 14-5-30.
//  Copyright (c) 2014年 JinyouHu. All rights reserved.
//

#import "HJYSendSMTPMail.h"
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import <CFNetwork/CFNetwork.h>

#define mailCenter_fromEmail @"发送邮箱"
#define mailCenter_relayHost @"smtp.163.com"
#define mailCenter_loginAccount @"发送邮箱"
#define mailCenter_loginPass @"!@密码"

@interface HJYSendSMTPMail()
{
    
}

@end

@implementation HJYSendSMTPMail

+ (SKPSMTPMessage *)sendMailTo:(NSString *)mailText
{
    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
    testMsg.fromEmail = mailCenter_fromEmail;
    testMsg.toEmail = @"发给哪个邮箱";
    
    //抄送联系人列表，如：@"1@qq.com;1@qq.com;2@q.com;3@qq.com"
    //testMsg.ccEmail = @"aug_88@163.com";
    //密送联系人列表，如：@"1@qq.com;1@qq.com;2@q.com;3@qq.com"
    //testMsg.bccEmail = @"aug_88@163.com";

    testMsg.relayHost = mailCenter_relayHost;
    
    testMsg.requiresAuth = YES;         //需要鉴权
    testMsg.login = mailCenter_loginAccount;
    testMsg.pass = mailCenter_loginPass;
    
    testMsg.subject = [NSString stringWithCString:[mailText UTF8String] encoding:NSUTF8StringEncoding ];
    testMsg.wantsSecure = YES; // smtp.gmail.com doesn't work without TLS!
    
    //主题
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                               mailText,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];

//    NSString *wavPath = [[NSBundle mainBundle] pathForResource:@"user" ofType:@"pdf"];
//    NSData *wavData = [NSData dataWithContentsOfFile:wavPath];
//    NSDictionary *wavPart = [[NSDictionary alloc ]initWithObjectsAndKeys:
//                             @"text/directory;\r\n\tx-unix-mode=0644;\r\n\tname=\"user.pdf\"",kSKPSMTPPartContentTypeKey,
//                             @"attachment;\r\n\tfilename=\"user.pdf\"",kSKPSMTPPartContentDispositionKey,
//                             [wavData encodeBase64ForData],kSKPSMTPPartMessageKey,
//                             @"base64",kSKPSMTPPartContentTransferEncodingKey,nil];
    
    testMsg.parts = [NSArray arrayWithObjects:plainPart, nil];
    
    
    return testMsg;
}


/*各大型邮箱smtp服务器及端口收集*/

/**
 
 >新浪邮箱smtp服务器
 外发服务器:smtp.vip.sina.com
 收件服务器:pop3.vip.sina.com
 新浪免费邮件
 外发服务器:smtp.sina.com.cn
 收件服务器:pop3.sina.com.cn
 
 
 
 >163邮箱smtp服务器
 pop： pop.163.com
 smtp： smtp.163.com
 
 
 
 >QQ邮箱smtp服务器及端口
 接收邮件服务器：imap.qq.com，使用SSL，端口号993
 发送邮件服务器：smtp.qq.com，使用SSL，端口号465或587
 
 
 >yahoo邮箱smtp服务器
 接：pop.mail.yahoo.com.cn
 发：smtp.mail.yahoo.com
 
 
 
 >126邮箱smtp服务器
 pop： pop.126.com
 smtp： smtp.126.com
 
 新浪免费邮箱
 
 POP3：pop.sina.com
 
 SMTP：smtp.sina.com
 
 SMTP端口号：25
 
 
 
 新浪VIP邮箱
 
 POP3：pop3.vip.sina.com
 
 SMTP：smtp.vip.sina.com
 
 SMTP端口号：25
 
 
 
 新浪企业邮箱
 
 POP3：pop.sina.com
 
 SMTP：smtp.sina.com
 
 SMTP端口号：25
 
 
 
 雅虎邮箱
 
 POP3：pop.mail.yahoo.cn
 
 SMTP：smtp.mail.yahoo.cn
 
 SMTP端口号：25
 
 
 
 搜狐邮箱
 
 POP3：pop3.sohu.com
 
 SMTP：smtp.sohu.com
 
 SMTP端口号：25
 
 
 
 TOM邮箱
 
 POP3：pop.tom.com
 
 SMTP：smtp.tom.com
 
 SMTP端口号：25
 
 
 
 Gmail邮箱
 
 POP3：pop.gmail.com
 
 SMTP：smtp.gmail.com
 
 SMTP端口号：587 或 25
 
 
 
 QQ邮箱
 
 POP3：pop.qq.com
 
 SMTP：smtp.qq.com
 
 SMTP端口号：25
 
 
 
 
 
 263邮箱
 
 域名：263.net
 
 POP3：263.net
 
 SMTP：smtp.263.net
 
 SMTP端口号：25
 
 
 
 域名：x263.net
 
 POP3：pop.x263.net
 
 SMTP：smtp.x263.net
 
 SMTP端口号：25
 
 
 
 域名：263.net.cn
 
 POP3：263.net.cn
 
 SMTP：263.net.cn
 
 SMTP端口号：25
 
 
 
 域名：炫我型
 
 POP3：pop.263xmail.com
 
 SMTP：smtp.263xmail.com
 
 SMTP端口号：25
 
 
 
 21CN  免费邮箱
 
 POP3：pop.21cn.com
 
 SMTP：smtp.21cn.com
 
 IMAP：imap.21cn.com
 
 SMTP端口号：25
 
 
 
 21CN  经济邮邮箱
 
 POP3：pop.21cn.com
 
 SMTP：smtp.21cn.com
 
 SMTP端口号：25
 
 
 
 21CN  商务邮邮箱
 
 POP3：pop.21cn.net
 
 SMTP：smtp.21cn.net
 
 SMTP端口号：25
 
 
 
 21CN  快感邮箱
 
 POP3：vip.21cn.com
 
 SMTP：vip.21cn.com
 
 SMTP端口号：25
 
 
 
 21CN  Y邮箱
 
 POP3：pop.y.vip.21cn.com
 
 SMTP：smtp.y.vip.21cn.com
 
 SMTP端口号：25
 
 
 
 中华网任我邮邮箱
 
 POP3：rwpop.china.com
 
 SMTP：rwsmtp.china.com
 
 SMTP端口号：25
 
 
 
 中华网时尚、商务邮箱
 
 POP3：pop.china.com
 
 SMTP：smtp.china.com
 
 SMTP端口号：25

 */

@end

