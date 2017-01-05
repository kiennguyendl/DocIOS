//
//  ViewController.m
//  DemoHelloWorld
//
//  Created by TNKHANH on 2/29/16.
//  Copyright © 2016 T3H. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Hello World!");
    
    int i = 5;
    i = i + 10;
    NSLog(@"i = %d",i);
    
    NSString *s = @"Xin chao, hom nay la thu 2";
    NSLog(@"s = %@",s);
    
    int anInt = -2147483648;
    unsigned int anUnsignedInt = 4294967295;
    NSLog(@"%d", anInt);
    NSLog(@"%d", anUnsignedInt);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
