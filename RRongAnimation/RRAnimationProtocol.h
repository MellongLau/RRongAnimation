//
//  RRAnimationProtocol.h
//  RRongAnimation
//
//  Created by mellong on 2024/10/17.
//  Copyright © 2024 tendencystudio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RRAnimationProtocol <NSObject>

@required
- (void)startAnimation;
- (void)stopAnimation;

@end

NS_ASSUME_NONNULL_END
