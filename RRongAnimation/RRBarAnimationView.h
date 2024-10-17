//
//  RRBarAnimationView.h
//  RRongAnimation
//
//  Created by Mellong Lau on 16/2/3.
//  Copyright © 2016年 tendencystudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRAnimationProtocol.h"

IB_DESIGNABLE
@interface RRBarAnimationView : UIView <RRAnimationProtocol>

@property (nonatomic, strong) IBInspectable UIColor *tintColor;


@end
