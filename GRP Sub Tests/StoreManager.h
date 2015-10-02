//
//  StoreManager.h
//  GRP Sub Tests
//
//  Created by Andrew Christensen on 10/2/15.
//  Copyright © 2015 Markit on Demand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@class StoreManager;

@protocol StoreManagerDelegate <NSObject>

- (void)storeManager:(StoreManager *)manager didFoundProducts:(NSArray *)products invalidProductIDs:(NSArray *)invalidIDs;
- (void)storemanager:(StoreManager *)manager requestDidFailWithError:(NSError *)error;

@end

@interface StoreManager : NSObject

@property (weak, nonatomic) id<StoreManagerDelegate> delegate;

- (void)requestProducts;

@end
