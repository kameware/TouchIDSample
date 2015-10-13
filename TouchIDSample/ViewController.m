//
//  ViewController.m
//  TouchIDSample
//
//  Created by mineharu on 2015/10/14.
//  Copyright © 2015年 Mineharu. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUpBtn:(id)sender {
    LAContext *context = [[LAContext alloc] init];
    NSError *error;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"認証しよこ！" reply:^(BOOL success, NSError * _Nullable error) {
            NSString *message;
            if (success) {
                message = @"成功";
            } else {
                message = @"失敗";
            }
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"認証結果!" message:message preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alert animated:YES completion:nil];
            });
        }];
    }
}
@end
