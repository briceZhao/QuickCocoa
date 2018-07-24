//
//  QULayoutButton.h
//  QuickCocoaDemo
//
//  Created by briceZhao on 2018/7/24.
//  Copyright © 2018年 BriceZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    /**水平布局, 和原始UIButton一样, 图片在左边, 标题文字在右边
     */
    QULayoutButtonStyleHorizontal,
    /**水平反向布局, 标题文字在左边, 图片在右边
     */
    QULayoutButtonStyleHorizontalReverse,
    /**竖直布局, 图片在上边, 标题文字在下边
     */
    QULayoutButtonStyleVertical,
    /**竖直布局, 标题文字在上边, 图片在下边
     */
    QULayoutButtonStyleVerticalReverse,
    /**自定义
     */
    QULayoutButtonStyleCustom,
    
} QULayoutButtonStyle;


@interface QULayoutButton : UIButton
{
    CGSize titleSize;
}
/**
 按钮内部imageView和titleLabel的布局样式
 */
@property (nonatomic, assign) QULayoutButtonStyle layoutStyle;
/**
 imageView和titleLabel的间距
 */
@property (nonatomic, assign) CGFloat margin;
/**
 如果自定义需要设置这两个值
 */
@property (nonatomic) CGRect titleRect;

@property (nonatomic) CGRect imageRect;


/**
 便利初始化方式
 */
- (instancetype)initWithLayoutStyle:(QULayoutButtonStyle)layoutStyle;

@end
