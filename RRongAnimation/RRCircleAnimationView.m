//
//  RRCircleAnimationView.m
//
//  Created by Mellong Lau on 16/7/6.
//

#import "RRCircleAnimationView.h"

#define MAX_RADIUS      50

@implementation RRCircleAnimationView
{
    CADisplayLink *_displayLink;
    UIBezierPath *_path;
    CGPoint _beginPoint;
    CGPoint _endPoint;
    CAShapeLayer *_shapeLayer;
    BOOL _isTouchEnd;
    int _currentFrame;
}


- (void)awakeFromNib
{
    _shapeLayer = [CAShapeLayer layer];
    [self.layer addSublayer:_shapeLayer];
    _shapeLayer.fillColor = [UIColor colorWithRed:0.400 green:0.400 blue:1.000 alpha:1.000].CGColor;
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateFrame)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)updateFrame {
    _path = [UIBezierPath bezierPathWithArcCenter:_beginPoint radius:[self getRadius] startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [_path setLineWidth:1];
    [_path closePath];
    _shapeLayer.path = _path.CGPath;
}

- (CGFloat)getRadius
{
    CGFloat result = sqrt(pow(_endPoint.x-_beginPoint.x, 2)+pow(_endPoint.y-_beginPoint.y, 2));
    if (_isTouchEnd) {
        CGFloat animationDuration = 1.0;
        int maxFrames = animationDuration / _displayLink.duration;
        _currentFrame++;
        
        if (_currentFrame <= maxFrames) {
            CGFloat factor = [self getSpringInterpolation:(CGFloat)(_currentFrame) / (CGFloat)(maxFrames)];
            return MAX_RADIUS + (result - MAX_RADIUS) * factor;
        }else {
            
            return MAX_RADIUS;
        }
    }
    return result;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    _beginPoint = point;
    
    _endPoint = point;
    _isTouchEnd = NO;
    _currentFrame = 1;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    _endPoint = point;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _isTouchEnd = YES;
    
}

- (CGFloat)getSpringInterpolation:(CGFloat)x
{
    CGFloat tension = 0.3;
    
    return pow(2, -10 * x) * sin((x - tension / 4) * (2 * M_PI) / tension);
}

@end
