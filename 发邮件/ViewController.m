//
//  ViewController.m
//  发邮件
//
//  Created by 程杰 on 16/6/2.
//  Copyright © 2016年 程杰. All rights reserved.
//

#import "ViewController.h"
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import <CFNetwork/CFNetwork.h>
#import "HJYSendSMTPMail.h"

@interface ViewController ()<SKPSMTPMessageDelegate>

{
    
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
       
    
    SKPSMTPMessage *messageSender = [HJYSendSMTPMail sendMailTo:@"宝宝心里苦"];
    messageSender.delegate = self;
    
    [messageSender send];


 }

- (void)messageSent:(SKPSMTPMessage *)message
{
    //发送成功
    NSLog(@"delegate - message sent");
    [self alert:@"发送成功"];
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    //发送失败
    [self alert:@"发送失败"];
    NSLog(@"%@",error);
}

- (void) alert:(NSString *)msg
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)messageState:(SKPSMTPMessage *)message sendState:(int)state
{
//    _progressLabel.text = [NSString stringWithFormat:@"%.2f",state/11.0];
//[_sendProgress setProgress:state/11.0];
}

- (void)messageSendInfo:(SKPSMTPMessage *)message sendInfo:(NSString *)info
{
   // NSMutableString *str = [[NSMutableString alloc] initWithString:_sendInfo.text];
    //[str appendFormat:@"\n%@\n",info];
   // _sendInfo.text = str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
