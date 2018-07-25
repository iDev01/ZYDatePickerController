//
//  NSBundle+ZYDatePickerController.h
//  Example
//
//  Created by Ma Hao on 2018/7/26.
//  Copyright © 2018 iDev_01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (ZYDatePickerController)

+ (instancetype)zy_bundle;
+ (NSString *)zy_localizedStringForKey:(NSString *)key;
+ (NSString *)zy_localizedStringForKey:(NSString *)key value:(NSString *)value;

@end
