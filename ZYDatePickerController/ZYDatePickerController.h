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

@property (weak, nonatomic) id<DatePickerDelegate> delegate;

- (instancetype)initWithMessage:(NSString *)message mode:(UIDatePickerMode)mode dateFormat:(NSString *)dateFormat;

- (instancetype)initWithMessage:(NSString *)message mode:(UIDatePickerMode)mode dateFormat:(NSString *)dateFormat handler:(void (^)(NSDate *date, NSString *dateString))handler;

- (void)setDate:(NSDate *)date;

- (void)setMinimumDate:(NSDate *)date;

- (void)setMaximumDate:(NSDate *)date;

@end

@protocol DatePickerDelegate <NSObject>

@optional

- (void)datePickerController:(ZYDatePickerController *)datePickerController didConfirmWithDate:(NSDate *)date formatDateString:(NSString *)dateString;

- (void)datePickerController:(ZYDatePickerController *)datePickerController didClickConfirmButtonWithDateString:(NSString *)dateString;

@end
