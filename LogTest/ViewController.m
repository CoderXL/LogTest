//
//  ViewController.m
//  LogTest
//
//  Created by zhangjunbo on 15/3/5.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(writeLogMessages:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)writeLogMessages:(NSTimer *)aTimer
{
    DDLogVerbose(@"I like cheese");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
