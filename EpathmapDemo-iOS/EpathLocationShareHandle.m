//
//  EpathLocationShareHandle.m
//  EpathmapDemo-iOS
//
//  Created by 王高峰 on 2018/3/5.
//  Copyright © 2018年 王高峰. All rights reserved.
//

#import "EpathLocationShareHandle.h"
#import "WXApi.h"
#import <MessageUI/MessageUI.h>

@interface EpathLocationShareHandle ()<MFMessageComposeViewControllerDelegate>

@end

@implementation EpathLocationShareHandle

+ (instancetype)sharedInstance {
    static EpathLocationShareHandle *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EpathLocationShareHandle alloc] init];
    });
    return sharedInstance;
}

- (void)IpsLocationShare:(IpsShareType)type title:(NSString *)title desc:(NSString *)desc url:(NSString *)url thumbImage:(UIImage *)image {
    switch (type) {
            case IpsShareTypeWeChat:
        {
            [self sendShareToWeChatWithtitle:title desc:desc url:url thumbImage:image];
        }
            break;
            case IpsShareTypeQQ:
        {
            [self sendShareToQQWithtitle:title desc:desc url:url thumbImage:image];
        }
            break;
            case IpsShareTypeSMS:
        {
            [self sendShareToSMSWithtitle:title desc:desc url:url];
        }
            break;
        default:
            break;
    }
}

- (void)sendShareToWeChatWithtitle:(NSString *)title desc:(NSString *)desc url:(NSString *)url thumbImage:(UIImage *)image {
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = desc;
    //分享的URL
    WXWebpageObject *ext = [WXWebpageObject object];
    NSCharacterSet *encodeUrlSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodeUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:encodeUrlSet];
    ext.webpageUrl = encodeUrl;
    message.mediaObject = ext;
    
    [message setThumbImage:image];
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = 0;
    [WXApi sendReq:req];
}

- (void)sendShareToQQWithtitle:(NSString *)title desc:(NSString *)desc url:(NSString *)url thumbImage:(UIImage *)image {
    
}

#pragma mark- 短信
- (void)sendShareToSMSWithtitle:(NSString *)title desc:(NSString *)desc url:(NSString *)url {
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        vc.body = url;
        vc.messageComposeDelegate = self;
        
        UIViewController *rootVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
        [rootVC presentViewController:vc animated:YES completion:nil];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    if (result == 0) {
        UIViewController *rootVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
        [rootVC dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
