//
//  HolderView.h
//  GroupAnimation
//
//  Created by amateur on 11/22/15.
//  Copyright © 2015 amateur. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HolderViewDelegate <NSObject>

- (void)animateLabel;
@end

@interface HolderView : UIView
@property (nonatomic, assign) id<HolderViewDelegate>delegate;

- (void)addOval;

@end
