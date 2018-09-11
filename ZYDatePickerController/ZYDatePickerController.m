//
//  ZYDatePickerController.m
//
//
//  Created by Ma Hao on 2018/7/23.
//  Copyright © 2018 zeroyear. All rights reserved.
//

#import "ZYDatePickerController.h"
#import "ZYPresentAnimator.h"
#import "ZYDismissAnimator.h"
#import <Masonry/Masonry.h>
#import "NSBundle+ZYDatePickerController.h"

typedef void(^DatePickerHandler)(NSString *dateString);

@interface ZYDatePickerController ()<UIViewControllerTransitioningDelegate, PresentAnimatorDelegate>

@property (strong, nonatomic) UIView *bodyView;
@property (strong, nonatomic) UILabel *messageLabel;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIButton *confirmButton;
@property (strong, nonatomic) UIButton *cancelButton;

@property (strong, nonatomic) NSString *dateFormat;
@property (strong, nonatomic) ZYPresentAnimator *presentAnimator;
@property (strong, nonatomic) DatePickerHandler handler;
@property (strong, nonatomic) NSString *message;


@end

@implementation ZYDatePickerController

- (instancetype)initWithMessage:(NSString *)message dateFormat:(NSString *)dateFormat handler:(void (^)(NSString *dateString))handler {
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        self.presentAnimator = [ZYPresentAnimator new];
        self.presentAnimator.delegate = self;
        self.message = message;
        self.handler = handler;
        self.bodyView = [[UIView alloc] init];
        self.bodyView.backgroundColor = [UIColor whiteColor];
        self.bodyView.layer.cornerRadius = 13;
        self.bodyView.layer.masksToBounds = YES;

        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.textColor = [UIColor colorWithWhite:0.56 alpha:1];
        self.messageLabel.font = [UIFont fontWithName:@".SFUIDisplay" size:13];
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        [self.bodyView addSubview:self.messageLabel];

        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
        [self.bodyView addSubview:lineView];

        UIView *lineView1 = [[UIView alloc] init];
        lineView1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.31 alpha:0.05];
        [self.bodyView addSubview:lineView1];

        self.datePicker = [[UIDatePicker alloc] init];
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSince1970:-3786854400];
        self.datePicker.maximumDate = [NSDate date];
        self.datePicker.date = self.datePicker.minimumDate;
        self.datePicker.backgroundColor = [UIColor whiteColor];
        self.datePicker.layer.cornerRadius = 13;
        self.datePicker.layer.masksToBounds = YES;
        [self.bodyView addSubview:self.datePicker];



        self.confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.confirmButton.layer.cornerRadius = 13;
        self.confirmButton.layer.masksToBounds = YES;
        self.confirmButton.titleLabel.font = [UIFont fontWithName:@".SFUIDisplay" size:20];
        [self.confirmButton setBackgroundColor:[UIColor whiteColor]];
        [self.confirmButton setTitleColor:[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1] forState:UIControlStateNormal];
        [self.confirmButton setTitle:[NSBundle zy_localizedStringForKey:@"confirm"]  forState:UIControlStateNormal];
        [self.confirmButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.layer.cornerRadius = 13;
        self.cancelButton.layer.masksToBounds = YES;
        self.cancelButton.titleLabel.font = [UIFont fontWithName:@".SFUIDisplay-Semibold" size:20];
        [self.cancelButton setBackgroundColor:[UIColor whiteColor]];
        [self.cancelButton setTitleColor:[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1] forState:UIControlStateNormal];
        [self.cancelButton setTitle:[NSBundle zy_localizedStringForKey:@"cancel"]  forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];

        [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.and.right.equalTo(self.bodyView);
            make.height.mas_equalTo(44);
        }];

        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.messageLabel.mas_bottom);
            make.left.and.right.equalTo(self.bodyView);
            make.height.mas_equalTo(1 / 3.0);
        }];

        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lineView);
        }];

        [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom);
            make.left.right.and.bottom.equalTo(self.bodyView);
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 422);
    self.view.backgroundColor = [UIColor clearColor];
    self.messageLabel.text = self.message;
    [self.view addSubview:self.bodyView];
    [self.view addSubview:self.confirmButton];
    [self.view addSubview:self.cancelButton];
    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.confirmButton.mas_top).offset(-8);
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.cancelButton.mas_top).offset(-8);
        make.height.mas_offset(57);
    }];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        if (@available(iOS 11.0, *)) {
            if ([UIScreen mainScreen].bounds.size.width == 375.f && [UIScreen mainScreen].bounds.size.height == 812.f) {
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-10);
            }
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        }
        make.height.mas_offset(57);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDate:(NSDate *)date {
    if (date == nil) {
        return;
    }
    self.datePicker.date = date;
}

- (void)confirm {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = self.dateFormat ?: @"yyyy-MM-dd";
    NSString *birthday = [dateFormatter stringFromDate:self.datePicker.date];
    if (self.handler) {
        self.handler(birthday);
    } else if (self.delegate) {
        [self.delegate datePickerController:self didClickConfirmButtonWithDateString:birthday];
    }
    [self cancel];
}

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [ZYDismissAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimator;
}

- (void)didTapEmptyArea {
    [self cancel];
}

@end
