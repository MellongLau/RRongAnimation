//
//  RRBarAnimationView.m
//  RRongAnimation
//
//  Created by Mellong Lau on 16/2/3.
//  Copyright © 2016年 tendencystudio. All rights reserved.
//

#import "RRBarAnimationView.h"

@interface RRBarAnimationView ()

@property (nonatomic, assign) NSInteger numberOfItem;
@property (nonatomic, assign) CGFloat paddingOfItem;
@property (nonatomic, assign) CGFloat paddingOfSide;
@property (nonatomic, assign) bool isAnimating;

@end

@implementation RRBarAnimationView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    _numberOfItem = 40;
    _paddingOfItem = 2.0;
    _paddingOfSide = 2.0;
    _tintColor = [UIColor colorWithRed:1.000 green:0.648 blue:0.140 alpha:1.000];
    
    [self createItems];
}

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    for (UIView *view in self.subviews) {
        view.backgroundColor = _tintColor;
    }
}

- (void)startAnimation
{
    _isAnimating = YES;
    for (int i = 0; i < self.subviews.count; i++) {
        [self animationWithItemIndex:i];
    }
}

- (void)stopAnimation
{
    _isAnimating = NO;
}

- (void)animationWithItemIndex:(NSInteger)index {
    if (!_isAnimating) {
        return;
    }
    __block CGRect frame = self.subviews[index].frame;
    NSInteger randomNumber = arc4random() % 90 + 5;
    CGFloat preHeight = frame.size.height;
    CGFloat currentHeight = self.bounds.size.height * randomNumber / 100.0;
    NSInteger randomDuration = arc4random() % 40 + 10;
    [UIView animateWithDuration:randomDuration / 100.0 delay:0.0
                        options:preHeight >= currentHeight ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn animations:^{
        
        frame.size.height = currentHeight;
        frame.origin.y = self.bounds.size.height - frame.size.height;
        self.subviews[index].frame = frame;
        
    } completion:^(BOOL finished) {
        
        [self animationWithItemIndex:index];
    }];
}

- (void)createItems {
    CGFloat itemWidth = (self.bounds.size.width - 2.0 * _paddingOfSide - (_numberOfItem - 1)*_paddingOfItem) / _numberOfItem;
    for (int i = 0; i < _numberOfItem; i++) {
        CGRect frame = CGRectMake(_paddingOfSide + i * (itemWidth + _paddingOfItem), self.bounds.size.height - 1.0, itemWidth, 1.0);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = _tintColor;
        [self addSubview:view];
    }
}

@end
