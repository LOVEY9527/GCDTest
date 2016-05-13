//
//  ViewController.m
//  GCDTest
//
//  Created by 李勇 on 16/5/11.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"123");
    
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
//    dispatch_sync(globalQueue, ^{
//        NSLog(@"dispatch_async");
//    });
    
//    dispatch_queue_t privateQueue = dispatch_queue_create("串行", nil);
//    dispatch_sync(privateQueue, ^{
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//           NSLog(@"privateQueue"); 
//        });
//    });
//    dispatch_async(globalQueue, ^{
//        NSLog(@"dispatch_async");
//    });
    
    NSLog(@"456");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
