//
//  RRCircleView.m
//  RRongAnimation
//
//  Created by Mellong Lau on 16/2/4.
//  Copyright © 2016年 tendencystudio. All rights reserved.
//

#import "RRCircleView.h"

@implementation RRCircleView

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
    _circleColor = [UIColor colorWithRed:1.000 green:0.647 blue:0.137 alpha:1.000];
    
}

- (void)drawRect:(CGRect)rect {
    
    [self drawCircle:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))];
}

- (void)drawCircle:(CGPoint)location
{
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    CGContextSaveGState(ctx);
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetFillColorWithColor(ctx, _circleColor.CGColor);
    CGContextAddArc(ctx, location.x, location.y, MIN(bounds.size.height, bounds.size.width)/2.0, 0.0, M_PI*2, YES);
    CGContextFillPath(ctx);
}

@end
