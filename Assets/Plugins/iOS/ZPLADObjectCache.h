//
//  ZPLADObjectCache.h
//  ZPLAYAdsPlugin
//
//  Created by lgd on 2018/11/19.
//  Copyright © 2018 ZPLAYAds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPLADObjectCache : NSObject

+ (instancetype)sharedInstance;

@property(nonatomic, strong) NSMutableDictionary *references;

@end

@interface NSObject (ZPLADOwnershipAdditions)

- (NSString *)zplad_referenceKey;

@end
