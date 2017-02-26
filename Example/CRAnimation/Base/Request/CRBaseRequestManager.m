//
//  CRBaseRequestManager.m
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseRequestManager.h"
#import <AFNetworking/AFNetworking.h>

static CRBaseRequestManager *kSharedManager;

@implementation CRBaseRequestManager

+ (CRBaseRequestManager *)sharedManager
{
    if (!kSharedManager) {
        kSharedManager = [[CRBaseRequestManager alloc] init];
    }
    
    return kSharedManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        return self;
    }
    
    return self;
}

- (void)postReuestWithURLStr:(NSString *)urlStr
                    paraDict:(NSDictionary *)paraDict
                     success:(void (^) ())success
                     failure:(void (^) ())failure
{
    AFHTTPSessionManager *sessionManager =[AFHTTPSessionManager manager];
    [sessionManager POST:urlStr
              parameters:paraDict
                progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSLog(@"--responseObject:%@", responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"--error:%@", error);
                }];
}

@end