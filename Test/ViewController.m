//
//  ViewController.m
//  Test
//
//  Created by zaiwei on 16/9/5.
//  Copyright © 2016年 zaiwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
button.frame=CGRectMake(100, 100, 100, 100);
button.backgroundColor=[UIColor redColor];
[self.view addSubview:button];
[button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}
-(void)click{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
