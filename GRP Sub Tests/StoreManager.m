//
//  StoreManager.m
//  GRP Sub Tests
//
//  Created by Andrew Christensen on 10/2/15.
//  Copyright © 2015 Markit on Demand. All rights reserved.
//

#import "StoreManager.h"

@interface StoreManager () <SKProductsRequestDelegate, SKRequestDelegate>

@property (strong, nonatomic) SKProductsRequest *productsRequest;

@end

@implementation StoreManager

- (void)requestProducts
{
    NSSet *productIDs = [NSSet setWithObjects:@"com.giantrobotpilot.OneYearProPlusTrial",
                         @"com.giantrobotpilot.OneMonthPro", nil];
    self.productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIDs];
    [self.productsRequest setDelegate:self];
    [self.productsRequest start];
}

#pragma mark - SKProductsRequestDelegate methods

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    if (response.products.count > 0) {
        NSLog(@"Products: %@", response.products);
    }
    if (response.invalidProductIdentifiers.count > 0) {
        NSLog(@"Invalid: %@", response.invalidProductIdentifiers);
    }
}

#pragma mark - SKRequestDelegate methods

- (void)requestDidFinish:(SKRequest *)request
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", error);
}

@end
