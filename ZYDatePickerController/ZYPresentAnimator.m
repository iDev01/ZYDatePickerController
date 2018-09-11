//
//  ZYPresentAnimator.m
//  
//
//  Created by Ma Hao on 2018/7/23.
//  Copyright © 2018 zeroyear. All rights reserved.
//

#import "ZYPresentAnimator.h"

@implementation ZYPresentAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgView.backgroundColor = [UIColor clearColor];
    [transitionContext.containerView addSubview:bgView];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [bgView addGestureRecognizer:tapGR];


    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0,
                              [UIScreen mainScreen].bounds.size.height,
                              [UIScreen mainScreen].bounds.size.width,
                              toView.frame.size.height);
    [transitionContext.containerView addSubview:toView];
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
                         toView.frame = CGRectMake(0,
                                                   [UIScreen mainScreen].bounds.size.height - toView.frame.size.height,
                                                   [UIScreen mainScreen].bounds.size.width,
                                                   toView.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (self.delegate) {
        [self.delegate didTapEmptyArea];
    }
}

@end
