//
//  OvalLayer.m
//  GroupAnimation
//
//  Created by amateur on 11/22/15.
//  Copyright © 2015 amateur. All rights reserved.
//

#import "OvalLayer.h"
#import <QuartzCore/QuartzCore.h>


@interface OvalLayer ()

@property (nonatomic, strong) UIBezierPath *ovalPathSmall;
@property (nonatomic, strong) UIBezierPath *ovalPathLarge;
@property (nonatomic, strong) UIBezierPath *ovalPathSquishVertical;
@property (nonatomic, strong) UIBezierPath *ovalPathSquishHorizonal;

@end

@implementation OvalLayer

- (instancetype)init
{
    self = [super init];
    if (self) {

        self.fillColor = [UIColor redColor].CGColor;
        self.path = self.ovalPathSmall.CGPath;
    }

    return self;
}


- (UIBezierPath *)ovalPathSmall
{
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 0, 0)];
}

- (UIBezierPath *)ovalPathLarge
{
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 17.5, 95, 95)];
}

- (UIBezierPath *)ovalPathSquishVertical
{
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 20, 95, 90)];
}

- (UIBezierPath *)ovalPathSquishHorizonal
{
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 20, 90, 90)];
}


- (void)contract
{
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.ovalPathLarge.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.ovalPathSmall.CGPath);
    expandAnimation.duration = 0.3;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = false;
    [self addAnimation:expandAnimation forKey:nil];
}

- (void)expand
{

    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.ovalPathSmall.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.ovalPathLarge.CGPath);
    expandAnimation.duration = 0.3;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = false;
    [self addAnimation:expandAnimation forKey:nil];
    
}

- (void)wobble
{
    CABasicAnimation *expandAnimation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation1.fromValue = (__bridge id _Nullable)(self.ovalPathLarge.CGPath);
    expandAnimation1.toValue = (__bridge id _Nullable)(self.ovalPathSquishVertical.CGPath);
    expandAnimation1.duration = 0.3;
    expandAnimation1.beginTime = 0.0;
    
    CABasicAnimation *expandAnimation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation2.fromValue = (__bridge id _Nullable)(self.ovalPathSquishVertical.CGPath);
    expandAnimation2.toValue = (__bridge id _Nullable)(self.ovalPathSquishHorizonal.CGPath);
    expandAnimation2.duration = 0.3;
    expandAnimation2.beginTime = expandAnimation1.beginTime + expandAnimation1.duration;
    
    CABasicAnimation *expandAnimation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation3.fromValue = (__bridge id _Nullable)(self.ovalPathSquishHorizonal.CGPath);
    expandAnimation3.toValue = (__bridge id _Nullable)(self.ovalPathSquishVertical.CGPath);
    expandAnimation3.duration = 0.3;
    expandAnimation3.beginTime = expandAnimation2.beginTime + expandAnimation2.duration;
    
    CABasicAnimation *expandAnimation4 = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation4.fromValue = (__bridge id _Nullable)(self.ovalPathSquishVertical.CGPath);
    expandAnimation4.toValue = (__bridge id _Nullable)(self.ovalPathLarge.CGPath);
    expandAnimation4.duration = 0.3;
    expandAnimation4.beginTime = expandAnimation3.beginTime + expandAnimation3.duration;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[expandAnimation1,expandAnimation2,expandAnimation3,expandAnimation4];
    group.duration = expandAnimation4.beginTime + expandAnimation4.duration;
    group.repeatCount = 2;
    [self addAnimation:group forKey:nil];

}


@end
