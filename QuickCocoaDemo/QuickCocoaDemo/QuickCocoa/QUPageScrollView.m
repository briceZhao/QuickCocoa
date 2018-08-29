//
//  QUPageScrollView.m
//  QuickUI
//
//  Created by briceZhao on 2018/7/15.
//  Copyright © 2018年 BriceZhao. All rights reserved.
//

#import "QUPageScrollView.h"
#import "QUPageTitleView.h"
#import "QUPageContentView.h"

@interface QUPageScrollView ()

@property (nonatomic, weak) QUPageTitleView *titleView;

@property (nonatomic, weak) QUPageContentView *contentView;

@end

@implementation QUPageScrollView

+ (instancetype)pageViewWithFrame:(CGRect)frame titles:(NSArray *)titles childVCs:(NSArray *)childVCs style:(QUPageScrollStyle *)style {
    QUPageScrollView *pageView = [[QUPageScrollView alloc]initWithFrame:frame];
    pageView.titles = titles;
    pageView.childVCs = childVCs;
    pageView.style = style;
    [pageView setupUI];
    return pageView;
}

- (void)setupUI {
    CGRect titleFrame = CGRectMake(0, 0, self.bounds.size.width, self.style.titleViewHeight);
    QUPageTitleView *titleView = [[QUPageTitleView alloc]initWithFrame:titleFrame titles:self.titles style:self.style];
    self.titleView = titleView;
    [self addSubview:titleView];
    
    CGRect contentFrame = CGRectMake(0, self.style.titleViewHeight, self.bounds.size.width, self.bounds.size.height - self.style.titleViewHeight);
    QUPageContentView *contentView = [[QUPageContentView alloc]initWithFrame:contentFrame childVCs:self.childVCs style:self.style];
    self.contentView = contentView;
    [self addSubview:contentView];
    //设置代理
    titleView.delegate = contentView;
    contentView.delegate = titleView;
}

- (void)setCurrentIndex:(NSInteger)index {
    [self.titleView setCurrentIndex:index];
    [self.contentView setCurrentIndex:index];
}

- (void)dealloc {
    NSLog(@"%@ has dealloc ~~", [self class]);
}

@end
