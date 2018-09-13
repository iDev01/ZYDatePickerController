//
//  ZYPresentAnimator.h
//  
//
//  Created by Ma Hao on 2018/7/23.
//  Copyright © 2018 zeroyear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYPresentAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic) UIView *backgroundView;

@end
