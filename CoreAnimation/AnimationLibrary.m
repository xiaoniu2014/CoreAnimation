//
//  AnimationLibrary.m
//  CoreAnimation
//
//  Created by hw on 15/10/21.
//  Copyright © 2015年 hongw. All rights reserved.
//

#define SCREEEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEEN_H [UIScreen mainScreen].bounds.size.height

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "AnimationLibrary.h"


@implementation AnimationLibrary

+ (instancetype)sharedAnimationLibrary {
    static AnimationLibrary *_sharedAnimationLibrary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAnimationLibrary = [[AnimationLibrary alloc]init];
    });
    
    return  _sharedAnimationLibrary;
}

- (void)transaction{
    //    事务
    [CATransaction begin];
    [CATransaction setAnimationDuration:2];
    self.layer.position = CGPointMake(300, 500);
    [CATransaction commit];
}


- (void)basicanimationBounds{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    CGRect frame = self.layer.frame;
    frame.size = CGSizeMake(100, 30);
    animation.toValue = [NSValue valueWithCGRect:frame];
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)basicanimationPosition{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint center = self.layer.position;
    center.y += 100.0f;
    animation.toValue = [NSValue valueWithCGPoint:center];
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)basicanimationTransformRotation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 1)];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    animation.duration = 1;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)basicanimationTransformTranslation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(200, 0, 0)];
    animation.duration = 0.5;
    animation.autoreverses = YES;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)animationGroup{
    self.layer.position = CGPointMake(30, 500);
    self.layer.cornerRadius = 3;
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.layer.position];
    [bezierPath addQuadCurveToPoint:CGPointMake(SCREEEN_W - 30, 100) controlPoint:CGPointMake(SCREEEN_W/2.0f, 0)];
    positionAnimation.path = bezierPath.CGPath;
    
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.byValue = [NSNumber numberWithFloat:M_PI];
    rotationAnimation.duration = 0.2;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.3];
    
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.delegate = self;
    groupAnimation.animations = @[positionAnimation,rotationAnimation,scaleAnimation];
    groupAnimation.duration = 1;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:groupAnimation forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"star");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"stop");
}


- (void)keyframeAnimationColor{
    self.layer.contents = nil;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    animation.values = @[(id)[UIColor redColor].CGColor,
                         (id)[UIColor greenColor].CGColor,
                         (id)[UIColor blueColor].CGColor,
                         (id)[UIColor yellowColor].CGColor,
                         (id)[UIColor purpleColor].CGColor,
                         (id)[UIColor blackColor].CGColor
                         ];
    
    animation.keyTimes = @[@0,
                           @0.2,
                           @0.35,
                           @0.55,
                           @0.6,
                           @1.0
                           ];
    animation.duration = 3;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)keyframeAnimationPosition{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSValue *value0 = [NSValue valueWithCGPoint:self.layer.position];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(400, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(400, 500)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(10, 500)];
    NSValue *value4 = [NSValue valueWithCGPoint:self.layer.position];
    
    animation.values = @[value0,
                         value1,
                         value2,
                         value3,
                         value4
                         ];
    
    animation.keyTimes = @[@0,
                           @0.1,
                           @0.11,
                           @0.6,
                           @0.66,
                           @1.0
                           ];
    animation.duration = 3;
    animation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)keyframeAnimationPath{
    
    self.layer.position = CGPointMake(SCREEEN_W, 300);
    self.layer.bounds = CGRectMake(0, 0, 30, 30);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.layer.position];
    
    [bezierPath addQuadCurveToPoint:CGPointMake(50 , SCREEEN_H-30) controlPoint:CGPointMake(SCREEEN_W/3.0f, self.layer.position.y-100)];
    animation.path = bezierPath.CGPath;
    animation.duration = 0.3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)keyframeAnimationShark{
    self.layer.cornerRadius = 3;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    CGFloat angle = 0.08/M_PI_2;
    NSNumber *number = [NSNumber numberWithFloat:angle];
    
    NSNumber *num = [NSNumber numberWithFloat:-0.08/M_PI_2];
    animation.values = @[num,number,num];
    animation.duration = 0.1;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)transition{
    CATransition *animation=[CATransition animation];
    animation.duration=0.8;
    animation.type=@"rippleEffect";
    [self.layer addAnimation:animation forKey:nil];
}

@end
