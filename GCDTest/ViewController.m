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
//    NSLog(@"123");
//    
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
//    dispatch_sync(globalQueue, ^{
//        NSLog(@"dispatch_async");
//    });
//    
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
//    
//    NSLog(@"456");
    
//    NSLog(@"Start:%@", [NSThread currentThread]);
//    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"Main:%@", [NSThread currentThread]);
//    });
//    
//    NSLog(@"End:%@", [NSThread currentThread]);
    
    NSLog(@"Start:%@", [NSThread currentThread]);
    
    /* 串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("www.serialgcd.test", DISPATCH_QUEUE_SERIAL);
    
    //1.同步执行串行队列，会在创建队列的线程上依次执行任务
//    dispatch_sync(serialQueue, ^{
//        sleep(1);
//        NSLog(@"tast1:%@", [NSThread currentThread]);
//    });
//    dispatch_sync(serialQueue, ^{
//        sleep(2);
//        NSLog(@"task2:%@", [NSThread currentThread]);
//    });
//    dispatch_sync(serialQueue, ^{
//        sleep(3);
//        NSLog(@"task2:%@", [NSThread currentThread]);
//    });
    
    //2.异步执行串行队列，会在创建队列的线程之外新起一个线程，并在新的线程上依次执行任务
//    dispatch_async(serialQueue, ^{
//        NSLog(@"task1:%@", [NSThread currentThread]);
//    });
//    dispatch_async(serialQueue, ^{
//        NSLog(@"task2:%@", [NSThread currentThread]);
//    });
//    dispatch_async(serialQueue, ^{
//        NSLog(@"task3:%@", [NSThread currentThread]);
//    });
    
    //3.同步异步掺杂的执行串行队列的话，只要最后一个任务不是异步执行，任务都会按顺序执行，现象可以通过代码看出来，但是原因还是不明白
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"task1:%@", [NSThread currentThread]);
//    });
//    dispatch_async(serialQueue, ^{
////        sleep(3);
//        NSLog(@"task2:%@", [NSThread currentThread]);
//    });
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"task3:%@", [NSThread currentThread]);
//    });
//    dispatch_async(serialQueue, ^{
//        NSLog(@"task4:%@", [NSThread currentThread]);
//    });
     */
    
    /* 并行队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("www.concurrentgcd.test", DISPATCH_QUEUE_CONCURRENT);
    
    //1.同步执行并行队列，会在创建队列的线程上依次执行任务，顺序固定
//    dispatch_sync(concurrentQueue, ^{
////        sleep(3);
//        NSLog(@"task1:%@", [NSThread currentThread]);
//    });
//    dispatch_sync(concurrentQueue, ^{
//        NSLog(@"task2:%@", [NSThread currentThread]);
//    });
//    dispatch_sync(concurrentQueue, ^{
////        sleep(3);
//        NSLog(@"task3:%@", [NSThread currentThread]);
//    });
    
    //2.异步执行并行队列，会在创建队列的线程之外为每一个任务起一个线程，每一个任务都在不同的线程上执行，并且执行的顺序不固定，随机的
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"task1:%@", [NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
////        sleep(3);
//        NSLog(@"task2:%@", [NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"task3:%@", [NSThread currentThread]);
//    });
    
    //3.同步异步掺杂的执行串行队列的话，异步执行的任务执行的时机是随机的
//    dispatch_sync(concurrentQueue, ^{
////        sleep(5);
//        NSLog(@"task1:%@", [NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
////        sleep(3);
//        NSLog(@"task2:%@", [NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
////        sleep(3);
//        NSLog(@"task3:%@", [NSThread currentThread]);
//    });
     */
    
    NSLog(@"end:%@", [NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
