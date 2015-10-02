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
    NSSet *productIDs = [NSSet setWithObjects:
                         @"com.giantrobotpilot.OneYearProPlusTrial",
                         @"com.giantrobotpilot.OneMonthPro",
                         nil];
    self.productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIDs];
    [self.productsRequest setDelegate:self];
    [self.productsRequest start];
}

#pragma mark - SKProductsRequestDelegate methods

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSMutableArray *products = [[NSMutableArray alloc] initWithCapacity:response.products.count];
    for (SKProduct *product in response.products) {
        [products addObject:[NSString stringWithFormat:@"%@ - %@", product.localizedTitle, product.price]];
    }
    [self.delegate storeManager:self didFoundProducts:products invalidProductIDs:response.invalidProductIdentifiers];
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
    [self.delegate storemanager:self requestDidFailWithError:error];
}

@end
