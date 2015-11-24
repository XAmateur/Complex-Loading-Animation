//
//  ArcLayer.m
//  GroupAnimation
//
//  Created by amateur on 11/24/15.
//  Copyright © 2015 amateur. All rights reserved.
//

#import "ArcLayer.h"
#import <UIKit/UIKit.h>

@interface ArcLayer ()

@property (nonatomic, strong) UIBezierPath *arcPathStarting;
@property (nonatomic, strong) UIBezierPath *arcPathPre;
@property (nonatomic, strong) UIBezierPath *arcPathLow;
@property (nonatomic, strong) UIBezierPath *arcPathMid;
@property (nonatomic, strong) UIBezierPath *arcPathHigh;
@property (nonatomic, strong) UIBezierPath *arcPathComplete;

@end
static CFTimeInterval animationDuration = 0.18;
@implementation ArcLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor orangeColor].CGColor;
        self.path = self.arcPathStarting.CGPath;
    }
    return self;
}

- (UIBezierPath *)arcPathPre
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 100.0)];
    [path addLineToPoint:CGPointMake(0.0, 99.0)];
    [path addLineToPoint:CGPointMake(100.0 , 99.0)];
    [path addLineToPoint:CGPointMake(100.0 , 100.0)];
    [path addLineToPoint:CGPointMake(0.0 , 100.0)];
    [path closePath];
    return path;
}

- (UIBezierPath *)arcPathStarting
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 100.0)];
    [path addLineToPoint:CGPointMake(0.0, 80.0)];
    [path addCurveToPoint:CGPointMake(100.0, 80.0) controlPoint1:CGPointMake(30.0, 70.0) controlPoint2:CGPointMake(40.0, 90.0)];
    [path addLineToPoint:CGPointMake(100.0, 100.0)];
    [path addLineToPoint:CGPointMake(0.0, 100.0)];
    [path closePath];
    
    return path;
}


- (UIBezierPath *)arcPathLow
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 100.0)];
    [path addLineToPoint:CGPointMake(0.0, 60.0)];
    [path addCurveToPoint:CGPointMake(100.0, 60.0) controlPoint1:CGPointMake(30.0, 65.0) controlPoint2:CGPointMake(40.0, 50.0)];
    [path addLineToPoint:CGPointMake(100.0 , 100.0)];
    [path addLineToPoint:CGPointMake(0.0 , 100.0)];
    [path closePath];
    return path;
}
- (UIBezierPath *)arcPathMid
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 100.0)];
    [path addLineToPoint:CGPointMake(0.0, 60.0)];
    [path addCurveToPoint:CGPointMake(100.0, 40.0) controlPoint1:CGPointMake(30.0, 30.0) controlPoint2:CGPointMake(40.0, 50.0)];
    [path addLineToPoint:CGPointMake(100.0 , 100.0)];
    [path addLineToPoint:CGPointMake(0.0 , 100.0)];
    [path closePath];
    return path;
}
- (UIBezierPath *)arcPathHigh
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 100.0)];
    [path addLineToPoint:CGPointMake(0.0, 20.0)];
    [path addCurveToPoint:CGPointMake(100.0, 20.0) controlPoint1:CGPointMake(30.0, 25.0) controlPoint2:CGPointMake(40.0, 10.0)];
    [path addLineToPoint:CGPointMake(100.0 , 100.0)];
    [path addLineToPoint:CGPointMake(0.0 , 100.0)];
    [path closePath];
    return path;
}
- (UIBezierPath *)arcPathComplete
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 100.0)];
    [path addLineToPoint:CGPointMake(0.0, -5.0)];
    [path addLineToPoint:CGPointMake(100.0 , -5.0)];
    [path addLineToPoint:CGPointMake(100.0 , 100.0)];
    [path addLineToPoint:CGPointMake(0.0 , 100.0)];
    [path closePath];
    return path;
}

- (void)animate
{
    CABasicAnimation *arcAnimationPre = [CABasicAnimation animationWithKeyPath:@"path"];
    arcAnimationPre.fromValue = (__bridge id _Nullable)(self.arcPathPre.CGPath);
    arcAnimationPre.toValue = (__bridge id _Nullable)(self.arcPathStarting.CGPath);
    arcAnimationPre.duration = animationDuration;
    arcAnimationPre.beginTime = 0.0;
    
    CABasicAnimation *arcAnimationLow = [CABasicAnimation animationWithKeyPath:@"path"];
    arcAnimationLow.fromValue = (__bridge id _Nullable)(self.arcPathStarting.CGPath);
    arcAnimationLow.toValue = (__bridge id _Nullable)(self.arcPathLow.CGPath);
    arcAnimationLow.duration = arcAnimationPre.beginTime + arcAnimationPre.duration;
    arcAnimationLow.beginTime = animationDuration;
    
    CABasicAnimation *arcAnimationMid = [CABasicAnimation animationWithKeyPath:@"path"];
    arcAnimationMid.fromValue = (__bridge id _Nullable)(self.arcPathLow.CGPath);
    arcAnimationMid.toValue = (__bridge id _Nullable)(self.arcPathMid.CGPath);
    arcAnimationMid.duration = animationDuration;
    arcAnimationMid.beginTime = arcAnimationLow.beginTime + arcAnimationLow.duration;
    
    CABasicAnimation *arcAnimationHigh = [CABasicAnimation animationWithKeyPath:@"path"];
    arcAnimationHigh.fromValue = (__bridge id _Nullable)(self.arcPathMid.CGPath);
    arcAnimationHigh.toValue = (__bridge id _Nullable)(self.arcPathHigh.CGPath);
    arcAnimationHigh.duration = animationDuration;
    arcAnimationHigh.beginTime = arcAnimationMid.beginTime + arcAnimationMid.duration;
    
    CABasicAnimation *arcAnimationComplete = [CABasicAnimation animationWithKeyPath:@"path"];
    arcAnimationComplete.fromValue = (__bridge id _Nullable)(self.arcPathHigh.CGPath);
    arcAnimationComplete.toValue = (__bridge id _Nullable)(self.arcPathComplete.CGPath);
    arcAnimationComplete.duration = animationDuration;
    arcAnimationComplete.beginTime = arcAnimationHigh.beginTime + arcAnimationHigh.duration;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[arcAnimationPre,arcAnimationLow,arcAnimationMid,arcAnimationHigh,arcAnimationComplete];
    group.duration = arcAnimationComplete.beginTime + arcAnimationComplete.duration;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = false;
    [self addAnimation:group forKey:nil];
}


@end
