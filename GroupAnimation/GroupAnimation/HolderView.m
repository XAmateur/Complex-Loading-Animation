//
//  HolderView.m
//  GroupAnimation
//
//  Created by amateur on 11/22/15.
//  Copyright © 2015 amateur. All rights reserved.
//

#import "HolderView.h"
#import "OvalLayer.h"
#import "TriangelLayer.h"
#import "RectangleLayer.h"
#import "ArcLayer.h"


@interface HolderView ()

@property (nonatomic, strong) OvalLayer *ovalLayer;
@property (nonatomic, strong) TriangelLayer *triangle;
@property (nonatomic, strong) ArcLayer *arcLayer;
@property (nonatomic, assign) CGRect parentFrame;
@property (nonatomic, assign) CGPoint center1;
@end

@implementation HolderView
{
    RectangleLayer *redRectangle;
    RectangleLayer *blueRectangle;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.parentFrame = CGRectZero;
        self.center1 = self.center;
    }
    return self;
}

- (void)addOval
{
    _ovalLayer = [[OvalLayer alloc]init];
    [self.layer addSublayer:_ovalLayer];
    [_ovalLayer expand];
    
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(wobbleOval) userInfo:nil repeats:NO];
}

- (void)wobbleOval
{
    _triangle = [[TriangelLayer alloc]init];
    [self.layer addSublayer:_triangle];
    [_ovalLayer wobble];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(drawAnimatedTriangle) userInfo:nil repeats:NO];

}

- (void)drawAnimatedTriangle
{
    [_triangle animate];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(spinAndTransform) userInfo:nil repeats:NO];
}

- (void)spinAndTransform
{
    self.layer.anchorPoint = CGPointMake(0.5, 0.6);
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    rotation.duration = 0.45;
    rotation.removedOnCompletion = true;
    [self.layer addAnimation:rotation forKey:nil];
    
    [_ovalLayer contract];
    [NSTimer scheduledTimerWithTimeInterval:0.45 target:self selector:@selector(drawRedAnimatedRectangle) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.65 target:self selector:@selector(drawBlueAnimatedRectangle) userInfo:nil repeats:NO];
}

- (void)drawRedAnimatedRectangle
{
     redRectangle = [[RectangleLayer alloc]init];
    [self.layer addSublayer:redRectangle];
    [redRectangle animateStrokeWithColor:[UIColor redColor]];
}

- (void)drawBlueAnimatedRectangle
{
    blueRectangle = [[RectangleLayer alloc]init];
    [self.layer addSublayer:blueRectangle];
    [blueRectangle animateStrokeWithColor:[UIColor orangeColor]];
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(drawArc) userInfo:nil repeats:NO];
}

- (void)drawArc
{
    _arcLayer = [[ArcLayer alloc]init];
    [self.layer addSublayer:_arcLayer];
    [_arcLayer animate];
    [NSTimer scheduledTimerWithTimeInterval:0.90 target:self selector:@selector(expandView) userInfo:nil repeats:NO];
}

- (void)expandView
{
    self.backgroundColor = [UIColor blueColor];
    self.frame = CGRectMake(self.frame.origin.x - blueRectangle.lineWidth,
                            self.frame.origin.y - blueRectangle.lineWidth,
                            self.frame.size.width + blueRectangle.lineWidth * 2,
                            self.frame.size.height + blueRectangle.lineWidth * 2);
    
    self.layer.sublayers = nil;
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = self.parentFrame;
        self.center = self.center1;
    } completion:^(BOOL finished) {
        [self addLabel];
    }];
}

- (void)addLabel
{
    [self.delegate animateLabel];
}
@end
