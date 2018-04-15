//
//  AYNavigationBar.m
//  UIViewController+AYNavigationBar
//
//  Created by G-Xi0N on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

#import "AYNavigationBar.h"

@interface AYNavigationBar()

@property (nonatomic, assign) CGFloat barBackgroundAlpha;

@end

@implementation AYNavigationBar

- (instancetype)initWithNavigationItem:(UINavigationItem *)navigationItem
{
    self = [super init];
    if (self) {
        _barBackgroundAlpha = 1;
        [self setItems:@[navigationItem]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.subviews.firstObject.alpha = _barBackgroundAlpha;
    self.subviews.firstObject.frame = CGRectMake(0, -CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame), self.bounds.size.width, self.bounds.size.height + CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame));
    UIVisualEffectView *visualEffectView = (UIVisualEffectView *)self.subviews.firstObject.subviews.lastObject;
    if ([visualEffectView isKindOfClass:[UIVisualEffectView class]]) {
        visualEffectView.contentView.backgroundColor = self.barTintColor;
    }
}

- (void)setAlpha:(CGFloat)alpha
{
    _barBackgroundAlpha = alpha;
    self.subviews.firstObject.alpha = alpha;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.barTintColor = backgroundColor;
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
    [super setBarTintColor:barTintColor];
    UIVisualEffectView *visualEffectView = (UIVisualEffectView *)self.subviews.firstObject.subviews.lastObject;
    if ([visualEffectView isKindOfClass:[UIVisualEffectView class]]) {
        visualEffectView.contentView.backgroundColor = self.barTintColor;
    }
}

@end
