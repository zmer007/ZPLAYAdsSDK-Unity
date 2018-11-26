//
//  ZPLADInterstitial.h
//  ZPLAYAdsPlugin
//
//  Created by lgd on 2018/11/15.
//  Copyright © 2018 ZPLAYAds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PlayableAds/PlayableAds.h>
#import "ZPLADTypes.h"

/// A wrapper around ZPLADInterstitial. Includes the ability to create ZPLADInterstitial objects,
/// load them with ads, show them, and listen for ad events.
@interface ZPLADInterstitial : NSObject

/// Initializes a ZPLADInterstitial
- (id)initWithInterstitialClientReference:(ZPLADTypeInterstitialClientRef *)interstitialClient
                                  adAppId:(NSString *)adAppId
                                 adUnitId:(NSString *)adUnitId;

/// The interstitial ad.
@property(nonatomic, strong) PlayableAds *interstitial;

/// A reference to the Unity interstitial client.
@property(nonatomic, assign) ZPLADTypeInterstitialClientRef *interstitialClient;

/// The ad received callback into Unity.
@property(nonatomic, assign) ZPLADInterstitialDidReceivedAdCallback adReceivedCallback;

/// The ad failed callback into Unity
@property(nonatomic, assign) ZPLADInterstitialDidFailToReceiveAdWithErrorCallback adFailedCallback;

/// The ad started playing callback into Unity.
@property(nonatomic, assign) ZPLADInterstitialVideoDidStartPlayingCallback videoDidStartCallback;

/// The ad "INSTALL" button is clicked callback into Unity.
@property(nonatomic, assign) ZPLADInterstitiaDidClickCallback adClickedCallback;

/// The ad was closed callback into Unity
@property(nonatomic, assign) ZPLADInterstitialVideoDidCloseCallback videoDidCloseCallback;

/// The ad did complete callback into Unity.
@property(nonatomic, assign) ZPLADInterstitialDidCompleteCallback adDidCompleteCallback;

- (void)loadAd;

- (BOOL)isReady;

- (void)show;

- (void)setAutoload: (BOOL)autoload;

- (void)setChannelId: (NSString *)channelId;

@end

