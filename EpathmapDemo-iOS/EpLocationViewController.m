//
//  EpLocationViewController.m
//  EpathmapDemo-iOS
//
//  Created by 王高峰 on 2018/3/5.
//  Copyright © 2018年 王高峰. All rights reserved.
//

#import "EpLocationViewController.h"
#import <EpathmapSDK/EpathmapSDK.h>
#import "EpathApiKey.h"

@interface EpLocationViewController ()<EpathmapLocationDelegate>

@property (nonatomic, strong)EpathmapLocationManger *manger;

@end

@implementation EpLocationViewController

- (void)dealloc {
    [self.manger stopLocatingEngine];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.manger = [EpathmapLocationManger new];
    self.manger.locationTimeOut = 20;
    self.manger.delegate = self;
    
    [self.manger startLocationEngine:(NSString *)MapId];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.manger stopLocatingEngine];
}

- (void)ipsmapLocationManager:(EpathmapLocationManger *_Nullable)manager didUpdateLocation:(EpathLocationInfo *_Nullable)location {
    if (location.inThisMap) {
        NSLog(@"在建筑物里面");
        [EpathAlertView showAlertWithTitle:nil message:@"在建筑物内" cancelButtonTitle:@"OK" otherButtonTitles:nil completion:nil];
    }else {
        [EpathAlertView showAlertWithTitle:nil message:@"在建筑物外" cancelButtonTitle:@"OK" otherButtonTitles:nil completion:nil];
    }
}

@end
