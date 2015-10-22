//
//  AnimationLibrary.h
//  CoreAnimation
//
//  Created by hw on 15/10/21.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationLibrary : NSObject

@property (nonatomic,strong) CALayer *layer;

+ (instancetype)sharedAnimationLibrary;


@end
