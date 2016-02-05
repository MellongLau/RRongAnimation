//
//  RRWaveAnimationView.m
//  RRongAnimation
//
//  Created by Mellong Lau on 16/2/4.
//  Copyright © 2016年 tendencystudio. All rights reserved.
//

#import "RRWaveAnimationView.h"
#import "RRCircleView.h"

@interface RRWaveAnimationView ()

@property (nonatomic, assign) NSInteger numberOfItem;

@end

@implementation RRWaveAnimationView

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
    _numberOfItem = 10;
    _circleColor = [UIColor colorWithRed:1.000 green:0.647 blue:0.137 alpha:1.000];
    [self createItems];
    [self startAnimation];
}

- (void)setTintColor:(UIColor *)tintColor
{
    _circleColor = tintColor;
    for (RRCircleView *view in self.subviews) {
        view.circleColor = _circleColor;
    }
}

- (void)startAnimation
{
    for (int i = 0; i < self.subviews.count; i++) {
        [self animationWithItemIndex:i];
    }
}

- (void)animationWithItemIndex:(NSInteger)index {

    __block CGRect frame = self.subviews[index].frame;
    NSInteger randomDuration = arc4random() % 40+10;
    NSInteger randomDelay = arc4random() % 40+20;
    [UIView animateWithDuration:randomDuration/15.0 delay:randomDelay/70.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        frame.size.height = self.bounds.size.height;
        frame.size.width = self.bounds.size.height;
        self.subviews[index].frame = frame;
        self.subviews[index].center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
        self.subviews[index].alpha = 0.0;
        [self.subviews[index] setNeedsDisplay];
        
    } completion:^(BOOL finished) {
        
        self.subviews[index].alpha = 0.9;
        self.subviews[index].frame = CGRectZero;
        self.subviews[index].center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);

        [self animationWithItemIndex:index];
    }];
}

- (void)createItems {
    for (int i = 0; i < _numberOfItem; i++) {
        CGRect frame = CGRectZero;
        UIView *view = [[RRCircleView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor clearColor];
        view.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
        view.alpha = 0.9;
        view.tintColor = _circleColor;
        [self addSubview:view];
    }
}

@end
