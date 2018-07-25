//
//  ViewController.m
//  ZYDatePickerController
//
//  Created by Ma Hao on 2018/7/24.
//  Copyright © 2018 iDev_01. All rights reserved.
//

#import "ViewController.h"
#import "ZYDatePickerController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)chooseDateButtonClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    ZYDatePickerController *datePickController = [[ZYDatePickerController alloc] initWithMessage:NSLocalizedString(@"pleaseChooseDate", nil) dateFormat:@"yyyy-MM-dd" handler:^(NSString *dateString) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.textField.text = dateString;
    }];
    [self presentViewController:datePickController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
