//
//  RRWaveAnimationView.h
//  RRongAnimation
//
//  Created by Mellong Lau on 16/2/4.
//  Copyright © 2016年 tendencystudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRAnimationProtocol.h"

IB_DESIGNABLE
@interface RRWaveAnimationView : UIView <RRAnimationProtocol>

@property (nonatomic, strong) IBInspectable UIColor *circleColor;

@end
