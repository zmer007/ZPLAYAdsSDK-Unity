//
//  ZPLADObjectCache.m
//  ZPLAYAdsPlugin
//
//  Created by lgd on 2018/11/19.
//  Copyright © 2018 ZPLAYAds. All rights reserved.
//

#import "ZPLADObjectCache.h"

@implementation ZPLADObjectCache

+ (instancetype)sharedInstance {
    static ZPLADObjectCache *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if(self){
        _references = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end

@implementation NSObject (ZPLADOwnershipAdditions)

- (NSString *)zplad_referenceKey {
    return [NSString stringWithFormat:@"%p", (void *)self];
}

@end
