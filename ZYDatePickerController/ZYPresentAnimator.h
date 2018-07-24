//
//  ZYPresentAnimator.h
//  
//
//  Created by Ma Hao on 2018/7/23.
//  Copyright © 2018 zeroyear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PresentAnimatorDelegate;

@interface ZYPresentAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic) UIView *backgroundView;

@property (weak, nonatomic) id<PresentAnimatorDelegate>delegate;

@end

@protocol PresentAnimatorDelegate

- (void)didTapEmptyArea;

@end
