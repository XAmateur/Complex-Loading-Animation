//
//  ViewController.m
//  GroupAnimation
//
//  Created by amateur on 11/22/15.
//  Copyright © 2015 amateur. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) HolderView *holderView;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self addHolderView];
}

- (void)addHolderView
{
    
    CGFloat boxSize = 100.0;
    self.holderView = [[HolderView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2 - boxSize/2,self.view.bounds.size.height/2 - boxSize/2, boxSize, boxSize)];
    self.holderView.delegate = self;
    [self.view addSubview:_holderView];
    [_holderView addOval];
}

- (void)animateLabel
{
    [_holderView removeFromSuperview];
    self.view.backgroundColor = [UIColor orangeColor];
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.frame];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:170];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"S";
    label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25);
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0);
    } completion:^(BOOL finished) {
        [self addButton];
    }];
}

- (void) addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:self.view.frame];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) buttonPressed
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view.subviews.lastObject removeFromSuperview];
    [_holderView setFrame:CGRectZero];;
    [self addHolderView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
