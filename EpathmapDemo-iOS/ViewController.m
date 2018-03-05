//
//  ViewController.m
//  EpathmapDemo-iOS
//
//  Created by 王高峰 on 2018/3/5.
//  Copyright © 2018年 王高峰. All rights reserved.
//

#import "ViewController.h"
#import "EpathApiKey.h"
#import "EpLocationViewController.h"
#import "EpathLocationShareHandle.h"
#import <EpathmapSDK/EpathmapSDK.h>

@interface EpathExample : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL selector;

@end


@implementation EpathExample

+ (instancetype)exampleWithTitle:(NSString *)title selector:(SEL)selector {
    EpathExample *example = [[self class] new];
    example.title = title;
    example.selector = selector;
    return example;
}

@end

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *aryExample;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"EpathmapSDK";
    
    [self.view addSubview:self.tableView];
}
#pragma mark 加载地图
-(void)btnClick 
{
    EpathMapViewController *vc = [[EpathMapViewController alloc] initWithMapId:MapId];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 设置需要分享的平台
- (void)mapExample {
    //设置需要分享的平台
    [EpathShareConfig showSharePlatforms:@[@(IpsShareTypeWeChat), @(IpsShareTypeQQ), @(IpsShareTypeSMS)]];
    
    EpathMapViewController *vc = [[EpathMapViewController alloc] initWithMapId:(NSString *)MapId];
    vc.locationShareDelegate = [EpathLocationShareHandle sharedInstance];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 导航到指定位置
- (void)navigationExample {
    EpathMapViewController *vc = [[EpathMapViewController alloc] initWithMapId:(NSString *)MapId targetName:@"饮水机" targetId:@"yinshuiji"];
    vc.locationShareDelegate = [EpathLocationShareHandle sharedInstance];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 判断是否地图范围内
- (void)locationExample {
    EpLocationViewController *vc = [[EpLocationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.aryExample count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"exampleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    EpathExample *example = [self.aryExample objectAtIndex:indexPath.row];
    cell.textLabel.text = example.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EpathExample *example = [self.aryExample objectAtIndex:indexPath.row];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:example.selector];
#pragma clang diagnostic pop
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44) style:UITableViewStylePlain];
        _tableView.rowHeight = 80;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSArray *)aryExample {
    if (_aryExample == nil) {
        _aryExample = @[[EpathExample exampleWithTitle:@"显示地图" selector:@selector(mapExample)],
                        [EpathExample exampleWithTitle:@"导航到具体位置" selector:@selector(navigationExample)],
                        [EpathExample exampleWithTitle:@"判断是否在地图内" selector:@selector(locationExample)],];
    }
    return _aryExample;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
