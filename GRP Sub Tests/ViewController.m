//
//  ViewController.m
//  GRP Sub Tests
//
//  Created by Andrew Christensen on 10/2/15.
//  Copyright © 2015 Markit on Demand. All rights reserved.
//

#import "ViewController.h"
#import "StoreManager.h"

@interface ViewController ()

@property (strong, nonatomic) StoreManager *storeManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.storeManager = [[StoreManager alloc] init];
    [self.storeManager requestProducts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
