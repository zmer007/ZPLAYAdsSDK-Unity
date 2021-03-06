//
//  ZPLADInterface.m
//  ZPLAYAdsPlugin
//
//  Created by lgd on 2018/11/16.
//  Copyright © 2018 ZPLAYAds. All rights reserved.
//

#import "ZPLADInterstitial.h"
#import "ZPLADRewardVideo.h"
#import "ZPLADTypes.h"
#import "ZPLADObjectCache.h"

static NSString *ZPLADStringFromUTF8String(const char *bytes) { return bytes ? @(bytes) : nil; }

/// Creates a ZPLADInterstitial and returns its reference
ZPLADTypeInterstitialRef ZPLADCreateInterstitial(ZPLADTypeInterstitialClientRef *interstitialClient,
                                                       const char *adAppID,
                                                       const char *adUnitID) {
    ZPLADInterstitial *interstitial = [[ZPLADInterstitial alloc]
                      initWithInterstitialClientReference:interstitialClient
                                       adAppId: ZPLADStringFromUTF8String(adAppID)
                                       adUnitId: ZPLADStringFromUTF8String(adUnitID)];
    ZPLADObjectCache *cache = [ZPLADObjectCache sharedInstance];
    [cache.references setObject:interstitial forKey:[interstitial zplad_referenceKey]];
    return (__bridge ZPLADTypeInterstitialRef)interstitial;
}

/// Sets the interstitial callback methods to be invoked during interstitial ad events.
void ZPLADSetInterstitialAdCallbacks(
        ZPLADTypeInterstitialClientRef interstitialAd,
        ZPLADInterstitialDidReceivedAdCallback adReceivedCallback,
        ZPLADInterstitialDidFailToReceiveAdWithErrorCallback adFailedCallback,
        ZPLADInterstitialVideoDidStartPlayingCallback videoDidStartCallback,
        ZPLADInterstitiaDidClickCallback adClickedCallback,
        ZPLADInterstitialVideoDidCloseCallback videoDidCloseCallback,
        ZPLADInterstitialDidCompleteCallback adDidCompleteCallback) {
    ZPLADInterstitial *internalInterstitialAd = (__bridge ZPLADInterstitial *)interstitialAd;
    internalInterstitialAd.adReceivedCallback = adReceivedCallback;
    internalInterstitialAd.adFailedCallback = adFailedCallback;
    internalInterstitialAd.videoDidStartCallback = videoDidStartCallback;
    internalInterstitialAd.adClickedCallback = adClickedCallback;
    internalInterstitialAd.videoDidCloseCallback = videoDidCloseCallback;
    internalInterstitialAd.adDidCompleteCallback = adDidCompleteCallback;
}

/// Makes an interstitial ad request.
void ZPLADRequestInterstitial(ZPLADTypeInterstitialRef interstitial) {    
    ZPLADInterstitial *internalInterstitial = (__bridge ZPLADInterstitial *)interstitial;
    [internalInterstitial loadAd];
}

/// Returns YES if the ZPLADInterstitial is ready to be shown.
BOOL ZPLADInterstitialReady(ZPLADTypeInterstitialRef interstitial) {
    ZPLADInterstitial *internalInterstitial = (__bridge ZPLADInterstitial *)interstitial;
    return [internalInterstitial isReady];
}

/// Shows the ZPLADInterstitial.
void ZPLADShowInterstitial(ZPLADTypeInterstitialRef interstitial) {
    ZPLADInterstitial *internalInterstitial = (__bridge ZPLADInterstitial *)interstitial;
    [internalInterstitial show];
}

/// Sets ZPLADInterstitial autoload next ad.
void ZPLADSetInterstitialAutoload(ZPLADTypeInterstitialRef interstitial, BOOL autoload) {
    ZPLADInterstitial *internalInterstitial = (__bridge ZPLADInterstitial *)interstitial;
    [internalInterstitial setAutoload:autoload];
}

/// Sets ZPLADInterstitial channel id.
void ZPLADSetInterstitialChannelId(ZPLADTypeInterstitialRef interstitial, const char *channelId) {
    ZPLADInterstitial *internalInterstitial = (__bridge ZPLADInterstitial *)interstitial;
    [internalInterstitial setChannelId:ZPLADStringFromUTF8String(channelId)];
}


/// Creates a ZPLADRewardVideo and returns its reference
ZPLADTypeRewardVideoRef ZPLADCreateRewardVideo(ZPLADTypeRewardVideoClientRef *rewardVideoClient,
                                                 const char *adAppID,
                                                 const char *adUnitID) {
    ZPLADRewardVideo *rewardVideo = [[ZPLADRewardVideo alloc]
                                       initWithRewardVideoClientReference:rewardVideoClient
                                       adAppId: ZPLADStringFromUTF8String(adAppID)
                                       adUnitId: ZPLADStringFromUTF8String(adUnitID)];
    ZPLADObjectCache *cache = [ZPLADObjectCache sharedInstance];
    [cache.references setObject:rewardVideo forKey:[rewardVideo zplad_referenceKey]];
    return (__bridge ZPLADTypeRewardVideoRef)rewardVideo;
}

/// Sets the interstitial callback methods to be invoked during interstitial ad events.
void ZPLADSetRewardVideoAdCallbacks(
        ZPLADTypeRewardVideoClientRef rewardVideoAd,
        ZPLADRewardVideoDidReceivedAdCallback adReceivedCallback,
        ZPLADRewardVideoDidFailToReceiveAdWithErrorCallback adFailedCallback,
        ZPLADRewardVideoVideoDidStartPlayingCallback videoDidStartCallback,
        ZPLADRewardVideoDidClickCallback adClickedCallback,
        ZPLADRewardVideoVideoDidCloseCallback videoDidCloseCallback,
        ZPLADRewardVideoDidRewardCallback adDidRewardCallback,
        ZPLADRewardVideoDidCompleteCallback adDidCompleteCallback) {
    ZPLADRewardVideo *internalRewardVideoAd = (__bridge ZPLADRewardVideo *)rewardVideoAd;
    internalRewardVideoAd.adReceivedCallback = adReceivedCallback;
    internalRewardVideoAd.adFailedCallback = adFailedCallback;
    internalRewardVideoAd.videoDidStartCallback = videoDidStartCallback;
    internalRewardVideoAd.adClickedCallback = adClickedCallback;
    internalRewardVideoAd.adRewardCallback = adDidRewardCallback;
    internalRewardVideoAd.videoDidCloseCallback = videoDidCloseCallback;
    internalRewardVideoAd.adDidCompleteCallback = adDidCompleteCallback;
}

/// Makes an reward video ad request.
void ZPLADRequestRewardVideo(ZPLADTypeRewardVideoRef rewardVideo) {
    ZPLADRewardVideo *internalRewardVideo = (__bridge ZPLADRewardVideo *)rewardVideo;
    [internalRewardVideo loadAd];
}

/// Returns YES if the ZPLADRewardVideo is ready to be shown.
BOOL ZPLADRewardVideoReady(ZPLADTypeRewardVideoRef rewardVideo) {
    ZPLADRewardVideo *internalRewardVideo = (__bridge ZPLADRewardVideo *)rewardVideo;
    return [internalRewardVideo isReady];
}

/// Shows the ZPLADRewardVideo.
void ZPLADShowRewardVideo(ZPLADTypeRewardVideoRef rewardVideo) {
    ZPLADRewardVideo *internalRewardVideo = (__bridge ZPLADRewardVideo *)rewardVideo;
    [internalRewardVideo show];
}

/// Sets ZPLADRewardVideo autoload next ad.
void ZPLADSetRewardVideoAutoload(ZPLADTypeRewardVideoRef rewardVideo, BOOL autoload) {
    ZPLADRewardVideo *internalRewardVideo = (__bridge ZPLADRewardVideo *)rewardVideo;
    [internalRewardVideo setAutoload:autoload];
}

/// Sets ZPLADRewardVideo channel id.
void ZPLADSetRewardVideoChannelId(ZPLADTypeRewardVideoRef rewardVideo, const char *channelId) {
    ZPLADRewardVideo *internalRewardVideo = (__bridge ZPLADRewardVideo *)rewardVideo;
    [internalRewardVideo setChannelId:ZPLADStringFromUTF8String(channelId)];
}

#pragma mark - Other methods
/// Removes an object from the cache.
void ZPLADRelease(ZPLADTypeRef ref) {
    if (ref) {
        ZPLADObjectCache *cache = [ZPLADObjectCache sharedInstance];
        [cache.references removeObjectForKey:[(__bridge NSObject *)ref zplad_referenceKey]];
    }
}
