//
//  EpathLocationShareHandle.h
//  EpathmapDemo-iOS
//
//  Created by 王高峰 on 2018/3/5.
//  Copyright © 2018年 王高峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EpathmapSDK/EpathmapSDK.h>

@interface EpathLocationShareHandle : NSObject<EpathLocationShareProtocol>

+ (instancetype)sharedInstance;

- (void)IpsLocationShare:(IpsShareType)type title:(NSString *)title desc:(NSString *)desc url:(NSString *)url thumbImage:(UIImage *)image;

@end
