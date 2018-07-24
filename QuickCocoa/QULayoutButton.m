//
//  QULayoutButton.m
//  QuickCocoaDemo
//
//  Created by briceZhao on 2018/7/24.
//  Copyright © 2018年 BriceZhao. All rights reserved.
//

#import "QULayoutButton.h"

@implementation QULayoutButton

- (instancetype)initWithLayoutStyle:(QULayoutButtonStyle)layoutStyle {
    self = [super init];
    if (self) {
        self.layoutStyle = layoutStyle;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layoutStyle = QULayoutButtonStyleHorizontal;
        self.margin = 5.f;
        self.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [self setTitleColor:[UIColor colorWithRed:34.0/255.0 green:34.0/255.0 blue:34.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return self;
}


#pragma mark - setter
- (void)setTitleRect:(CGRect)titleRect {
    _titleRect = titleRect;
    [self setNeedsDisplay];
}

- (void)setImageRect:(CGRect)imageRect {
    _imageRect = imageRect;
    [self setNeedsDisplay];
}

- (void)setMargin:(CGFloat)margin {
    _margin = margin;
    [self setNeedsDisplay];
}

- (void)setLayoutStyle:(QULayoutButtonStyle)layoutStyle {
    _layoutStyle = layoutStyle;
    [self setNeedsDisplay];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    if (title) {
        titleSize = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    } else {
        titleSize = CGSizeZero;
    }
}

- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state {
    [super setAttributedTitle:title forState:state];
    if (title) {
        titleSize = [title boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    } else {
        titleSize = CGSizeZero;
    }
}

#pragma mark - Ovrride -
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect titleRect = [super titleRectForContentRect:contentRect];
    CGRect newTitleRect = titleRect;
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    
    switch (self.layoutStyle) {
        case QULayoutButtonStyleHorizontal:
        {
            if (CGRectEqualToRect(imageRect, CGRectZero)) {
                newTitleRect = titleRect;
            } else {
                newTitleRect = CGRectMake(CGRectGetMaxX(imageRect) + self.margin/2, titleRect.origin.y, titleRect.size.width, titleRect.size.height);
            }
        }
            break;
        case QULayoutButtonStyleHorizontalReverse:
        {
            if (CGRectEqualToRect(imageRect, CGRectZero)) {
                newTitleRect = titleRect;
            } else {
                newTitleRect = CGRectMake(imageRect.origin.x - self.margin/2, titleRect.origin.y, titleRect.size.width, titleRect.size.height);
            }
        }
            break;
        case QULayoutButtonStyleVertical:
        {
            if (CGRectEqualToRect(imageRect, CGRectZero)) {
                newTitleRect = titleRect;
            } else {
                
                CGFloat imageY = contentRect.size.height/2 - (imageRect.size.height + self.margin + titleRect.size.height)/2;
                CGFloat titleY = imageY + imageRect.size.height + self.margin/2;
                newTitleRect = CGRectMake(contentRect.size.width/2 - titleSize.width/2, titleY, titleSize.width, titleSize.height);
            }
        }
            break;
        case QULayoutButtonStyleVerticalReverse:
        {
            if (CGRectEqualToRect(imageRect, CGRectZero)) {
                newTitleRect = titleRect;
            } else {
                CGFloat titleY = contentRect.size.height/2 - (imageRect.size.height + self.margin + titleRect.size.height)/2;
                
                newTitleRect = CGRectMake(contentRect.size.width/2 - titleSize.width/2, titleY, titleSize.width, titleSize.height);
            }
        }
            break;
        case QULayoutButtonStyleCustom:
        {
            newTitleRect = _titleRect;
        }
            break;
    }
    return newTitleRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    CGRect newImageRect = imageRect;
    CGRect titleRect = [super titleRectForContentRect:contentRect];
    
    switch (self.layoutStyle) {
        case QULayoutButtonStyleHorizontal:
        {
            if (CGRectEqualToRect(titleRect, CGRectZero)) {
                newImageRect = imageRect;
            } else {
                CGFloat imageHScale = titleRect.size.height/imageRect.size.height;
                CGFloat imageH = titleRect.size.height;
                CGFloat imageW = imageRect.size.width * imageHScale;
                newImageRect = CGRectMake(imageRect.origin.x - self.margin/2, imageRect.origin.y, imageW, imageH);
            }
        }
            break;
        case QULayoutButtonStyleHorizontalReverse:
        {
            if (CGRectEqualToRect(titleRect, CGRectZero)) {
                newImageRect = imageRect;
            } else {
                CGFloat imageH = imageRect.size.height;                CGFloat imageW = imageRect.size.width;
                newImageRect = CGRectMake(CGRectGetMaxX(titleRect) + self.margin/2 - imageW, imageRect.origin.y, imageW, imageH);
            }
        }
            break;
        case QULayoutButtonStyleVertical:
        {
            if (CGRectEqualToRect(titleRect, CGRectZero)) {
                newImageRect = imageRect;
            } else {
                CGFloat imageY = contentRect.size.height/2 - (imageRect.size.height + self.margin + titleRect.size.height)/2;
                newImageRect = CGRectMake(contentRect.size.width/2-imageRect.size.width/2, imageY, imageRect.size.width, imageRect.size.height);
            }
        }
            break;
        case QULayoutButtonStyleVerticalReverse:
        {
            if (CGRectEqualToRect(titleRect, CGRectZero)) {
                newImageRect = imageRect;
            } else {
                CGFloat titleY = contentRect.size.height/2 - (imageRect.size.height+self.margin + titleSize.height)/2;
                CGFloat imageY = titleY + titleSize.height + self.margin/2;
                newImageRect = CGRectMake(contentRect.size.width/2-imageRect.size.width/2, imageY, imageRect.size.width, imageRect.size.height);
            }
        }
            break;
        case QULayoutButtonStyleCustom:
        {
            newImageRect = _imageRect;
        }
            break;
    }
    return newImageRect;
}


@end
