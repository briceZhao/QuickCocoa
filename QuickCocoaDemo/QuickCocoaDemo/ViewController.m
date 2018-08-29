//
//  ViewController.m
//  QuickCocoaDemo
//
//  Created by BriceZH on 2018/7/17.
//  Copyright © 2018年 BriceZhao. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "QUPageScrollView.h"

@interface ViewController ()
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, weak) QUPageScrollView *pageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *titles = @[@"推荐",@"视频",@"图片",@"段子",@"投票",@"头条新闻",@"世界杯",@"澳门赌场",@"网红新闻"];
    QUPageScrollStyle *style = [QUPageScrollStyle style];
    style.isNeedTitleScale = NO;
    style.isScrollEnable = YES;
    style.selectIndex = 3;
    
    NSMutableArray *childVCs = [NSMutableArray arrayWithCapacity:titles.count];
    for (NSString *title in titles) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [self randomColor];
        vc.title = title;
        [childVCs addObject:vc];
    }
    QUPageScrollView *pageView = [QUPageScrollView pageViewWithFrame:CGRectMake(0, 200, kScreenWidth, 300) titles:titles childVCs:childVCs style:style];
    self.pageView = pageView;
    [self.view addSubview:pageView];
}


- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSInteger random = arc4random_uniform(8);
    [self.pageView setCurrentIndex: random];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
