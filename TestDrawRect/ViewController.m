//
//  ViewController.m
//  TestDrawRect
//
//  Created by ys on 15/12/31.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "ViewController.h"

#import "DrawView.h"

#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    DrawView *drawView = [[DrawView alloc] initWithFrame:CGRectMake(100, 100, 500, 500)];
//    drawView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:drawView];
    
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    customView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:customView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
