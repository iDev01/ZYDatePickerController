//
//  ZYDismissAnimator.m
//  
//
//  Created by Ma Hao on 2018/7/23.
//  Copyright © 2018 zeroyear. All rights reserved.
//

#import "ZYDismissAnimator.h"

@implementation ZYDismissAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView * bgView = transitionContext.containerView.subviews[0];
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 378);
                         bgView.backgroundColor = [UIColor clearColor];
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
}

@end
