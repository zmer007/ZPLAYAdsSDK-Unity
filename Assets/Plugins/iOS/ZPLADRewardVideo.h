//
//  ZPLADRewardVideo.h
//  ZPLAYAdsPlugin
//
//  Created by lgd on 2018/11/20.
//  Copyright © 2018 ZPLAYAds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PlayableAds/PlayableAds.h>
#import "ZPLADTypes.h"

@interface ZPLADRewardVideo : NSObject
/// Initializes a ZPLADRewardVideo
- (id)initWithRewardVideoClientReference:(ZPLADTypeRewardVideoClientRef *)interstitialClient
                                 adAppId:(NSString *)adAppId
                                adUnitId:(NSString *)adUnitId;

/// The reward video ad.
@property(nonatomic, strong) PlayableAds *rewardVideo;

/// A reference to the Unity reward video client.
@property(nonatomic, assign) ZPLADTypeRewardVideoClientRef *rewardVideoClient;

/// The ad received callback into Unity.
@property(nonatomic, assign) ZPLADRewardVideoDidReceivedAdCallback adReceivedCallback;

/// The ad failed callback into Unity.
@property(nonatomic, assign) ZPLADRewardVideoDidFailToReceiveAdWithErrorCallback adFailedCallback;

/// The ad started playing callback into Unity.
@property(nonatomic, assign) ZPLADRewardVideoVideoDidStartPlayingCallback videoDidStartCallback;

/// The ad "INSTALL" button is clicked callback into Unity.
@property(nonatomic, assign) ZPLADRewardVideoDidClickCallback adClickedCallback;

/// The user was rewarded callback into Unity.
@property(nonatomic, assign) ZPLADRewardVideoDidRewardCallback adRewardCallback;

/// The ad was closed callback into Unity.
@property(nonatomic, assign) ZPLADRewardVideoVideoDidCloseCallback videoDidCloseCallback;

/// The ad did complete callback into Unity.
@property(nonatomic, assign) ZPLADRewardVideoDidCompleteCallback adDidCompleteCallback;

- (void)loadAd;

- (BOOL)isReady;

- (void)show;

- (void)setAutoload: (BOOL)autoload;

- (void)setChannelId: (NSString *)channelId;

@end
