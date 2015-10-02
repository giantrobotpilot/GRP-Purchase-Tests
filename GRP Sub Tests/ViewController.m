//
//  ViewController.m
//  GRP Sub Tests
//
//  Created by Andrew Christensen on 10/2/15.
//  Copyright © 2015 Markit on Demand. All rights reserved.
//

#import "ViewController.h"
#import "StoreManager.h"

@interface ViewController () <StoreManagerDelegate>

@property (strong, nonatomic) StoreManager *storeManager;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.text = @"";
    
    self.storeManager = [[StoreManager alloc] init];
    self.storeManager.delegate = self;
    [self.storeManager requestProducts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - StoreManagerDelegate implementation

- (void)storeManager:(StoreManager *)manager didFoundProducts:(NSArray *)products invalidProductIDs:(NSArray *)invalidIDs
{
    self.textView.text = @"";
    NSMutableString *output = [[NSMutableString alloc] initWithString:@"PRODUCTS"];
    [output appendString:@"\n"];
    for (NSString *product in products) {
        [output appendFormat:@"\t%@\n", product];
    }
    [output appendFormat:@"INVALID IDs\n"];
    for (NSString *invalid in invalidIDs) {
        [output appendFormat:@"\t%@\n", invalid];
    }
    self.textView.text = output;
}

- (void)storemanager:(StoreManager *)manager requestDidFailWithError:(NSError *)error
{
    self.textView.text = [NSString stringWithFormat:@"ERROR:\n%@", error.localizedDescription];
}

@end
