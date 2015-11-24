//
//  TriangelLayer.m
//  GroupAnimation
//
//  Created by amateur on 11/22/15.
//  Copyright © 2015 amateur. All rights reserved.
//

#import "TriangelLayer.h"
#import <UIKit/UIKit.h>

@interface TriangelLayer ()

@property (nonatomic, strong) UIBezierPath *trianglePathSmall;
@property (nonatomic, strong) UIBezierPath *trianglePathLeftExtension;
@property (nonatomic, strong) UIBezierPath *trianglePathRightExtension;
@property (nonatomic, strong) UIBezierPath *trianglePathTopExtension;

@end

@implementation TriangelLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor redColor].CGColor;
        self.strokeColor = [UIColor redColor].CGColor;
        self.lineWidth = 7.0;
        self.lineCap = kCALineCapRound;
        self.lineJoin = kCALineJoinRound;
        self.path = self.trianglePathSmall.CGPath;
    }
    
    return self;
}

- (UIBezierPath *)trianglePathSmall
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat innerPadding = 30.0;
    [path moveToPoint:CGPointMake(50, 50+innerPadding)];
    [path addLineToPoint:CGPointMake(50, 12.5+innerPadding)];
    [path addLineToPoint:CGPointMake(95.0 - innerPadding, 95.0)];
    [path closePath];
    
    return path;
}

- (UIBezierPath *)trianglePathLeftExtension
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat innerPadding = 30.0;
    [path moveToPoint:CGPointMake(5.0+innerPadding,95)];
    [path addLineToPoint:CGPointMake(50, 12.5+innerPadding)];
    [path addLineToPoint:CGPointMake(95.0 - innerPadding, 95.0)];
    [path closePath];
    
    return path;
}

- (UIBezierPath *)trianglePathRightExtension
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat innerPadding = 30.0;
    [path moveToPoint:CGPointMake(5.0, 95.0)];
    [path addLineToPoint:CGPointMake(50, 12.5 + innerPadding)];
    [path addLineToPoint:CGPointMake(95.0 - innerPadding, 95.0)];
    [path closePath];
    
    return path;
}

- (UIBezierPath *)trianglePathTopExtension
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(5.0, 95.0)];
    [path addLineToPoint:CGPointMake(50, 12.5)];
    [path addLineToPoint:CGPointMake(95.0 , 95.0)];
    [path closePath];
    
    return path;
}

- (void)animate
{
    CABasicAnimation *triangleAnimationLeft = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationLeft.fromValue = (__bridge id _Nullable)(self.trianglePathSmall.CGPath);
    triangleAnimationLeft.toValue = (__bridge id _Nullable)(self.trianglePathLeftExtension.CGPath);
    triangleAnimationLeft.duration = 0.3;
    triangleAnimationLeft.beginTime = 0.0;
    
    CABasicAnimation *triangleAnimationRight = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationRight.fromValue = (__bridge id _Nullable)(self.trianglePathLeftExtension.CGPath);
    triangleAnimationRight.toValue = (__bridge id _Nullable)(self.trianglePathRightExtension.CGPath);
    triangleAnimationRight.duration = 0.25;
    triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration;
    
    CABasicAnimation *triangleAnimationTop = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationTop.fromValue = (__bridge id _Nullable)(self.trianglePathRightExtension.CGPath);
    triangleAnimationTop.toValue = (__bridge id _Nullable)(self.trianglePathTopExtension.CGPath);
    triangleAnimationTop.duration = 0.20;
    triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[triangleAnimationLeft,triangleAnimationRight,triangleAnimationTop];
    group.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = false;
    [self addAnimation:group forKey:nil];

}

@end
