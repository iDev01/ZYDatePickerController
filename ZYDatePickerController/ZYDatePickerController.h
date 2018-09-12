//
//  ZYDatePickerController.h
//  
//
//  Created by Ma Hao on 2018/7/23.
//  Copyright © 2018 zeroyear. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerDelegate;

@interface ZYDatePickerController : UIViewController

@property (strong, nonatomic) id<DatePickerDelegate> delegate;

- (instancetype)initWithMessage:(NSString *)message mode:(UIDatePickerMode)mode dateFormat:(NSString *)dateFormat handler:(void (^)(NSString *dateString))handler;

- (void)setDate:(NSDate *)date;

@end

@protocol DatePickerDelegate

@optional
- (void)datePickerController:(ZYDatePickerController *)datePickerController didClickConfirmButtonWithDateString:(NSString *)dateString;

@end
