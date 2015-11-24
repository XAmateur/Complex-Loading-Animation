//
//  RectangleLayer.m
//  GroupAnimation
//
//  Created by amateur on 11/22/15.
//  Copyright © 2015 amateur. All rights reserved.
//

#import "RectangleLayer.h"

@interface RectangleLayer ()
@property (nonatomic, strong) UIBezierPath *rectanglePathFull;
@property (nonatomic, strong) UIBezierPath *fromPath;
@property (nonatomic, strong) UIBezierPath *toPath;


@end

@implementation RectangleLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor purpleColor].CGColor;
        self.lineWidth = 5.0;
        self.path = self.rectanglePathFull.CGPath;
    }
    
    return self;
}

- (UIBezierPath *)rectanglePathFull
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(0, -self.lineWidth)];
    [path addLineToPoint:CGPointMake(100, -self.lineWidth)];
    [path addLineToPoint:CGPointMake(100.0,100.0)];
    [path addLineToPoint:CGPointMake(-self.lineWidth/2 ,100.0)];
    [path closePath];

    return path;
}

- (void)animateStrokeWithColor:(UIColor *)color
{
    self.strokeColor = color.CGColor;
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.fromValue = [NSNumber numberWithFloat:0];
    strokeAnimation.toValue = [NSNumber numberWithFloat:1];
    strokeAnimation.duration = 0.4;
    [self addAnimation:strokeAnimation forKey:nil];
}


@end
