//
//  ViewController.m
//  RRongAnimation
//
//  Created by mellong on 2024/10/17.
//  Copyright © 2024 tendencystudio. All rights reserved.
//

#import "ViewController.h"
#import "RRBarAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // try to find current view of the view controller and its the subview is conform to RRAnimationProtocol and call its startAnimation method
    // need to include the view of the view controller
    NSMutableArray *views = [NSMutableArray arrayWithObject:self.view];
    [views addObjectsFromArray:self.view.subviews];
    for (UIView *view in views) {
        if ([view conformsToProtocol:@protocol(RRAnimationProtocol)]) {
            id<RRAnimationProtocol> animationView = (id<RRAnimationProtocol>)view;
            [animationView startAnimation];
        }
    }
    
    // try to find current view of the view controller and its the subview is conform to RRAnimationProtocol and call its startAnimation method
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // try to find the subview is conform to RRAnimationProtocol and call its stopAnimation method
    NSMutableArray *views = [NSMutableArray arrayWithObject:self.view];
    [views addObjectsFromArray:self.view.subviews];
    for (UIView *view in views) {
        if ([view conformsToProtocol:@protocol(RRAnimationProtocol)]) {
            id<RRAnimationProtocol> animationView = (id<RRAnimationProtocol>)view;
            [animationView stopAnimation];
        }
    }
    
}

@end
