//
//  NSBundle+ZYDatePickerController.m
//  Example
//
//  Created by Ma Hao on 2018/7/26.
//  Copyright © 2018 iDev_01. All rights reserved.
//

#import "NSBundle+ZYDatePickerController.h"
#import "ZYDatePickerController.h"

@implementation NSBundle (ZYDatePickerController)

+ (instancetype)zy_bundle {
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[ZYDatePickerController class]] pathForResource:@"ZYDatePickerController" ofType:@"bundle"]];
    }
    return bundle;
}

+ (NSString *)zy_localizedStringForKey:(NSString *)key {
    return [self zy_localizedStringForKey:key value:nil];
}

+ (NSString *)zy_localizedStringForKey:(NSString *)key value:(NSString *)value {
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        NSString *language = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) {
            language = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans";
            } else {
                language = @"zh-Hant";
            }
        } else {
            language = @"en";
        }
        bundle = [NSBundle bundleWithPath:[[NSBundle zy_bundle] pathForResource:language ofType:@"lproj"]];
    }
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

@end
