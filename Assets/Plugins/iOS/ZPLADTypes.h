//
//  ZPLADTypes.h
//  ZPLAYAdsPlugin
//
//  Created by lgd on 2018/11/15.
//  Copyright © 2018 ZPLAYAds. All rights reserved.
//

/// Base type representing a ZPLAD* pointer
typedef const void *ZPLADTypeRef;

/// Type representing a Unity interstitial client
typedef const void *ZPLADTypeInterstitialClientRef;

/// Type representing a Unity reward video client
typedef const void *ZPLADTypeRewardVideoClientRef;

/// Type representing a ZPLADInterstitialRef
typedef const void *ZPLADTypeInterstitialRef;

/// Type representing a ZPLADRewardVideoRef
typedef const void *ZPLADTypeRewardVideoRef;

/// Callback for when a interstitial ad request was successfully loaded.
typedef void (*ZPLADInterstitialDidReceivedAdCallback)(
    ZPLADTypeInterstitialClientRef *interstitialClient);

/// Callback for when a interstitial ad request failed.
typedef void (*ZPLADInterstitialDidFailToReceiveAdWithErrorCallback)(
    ZPLADTypeInterstitialClientRef *interstitialClient, const char *error);

/// Callback for when a interstitial video has started to play.
typedef void (*ZPLADInterstitialVideoDidStartPlayingCallback)(
    ZPLADTypeInterstitialClientRef *interstitialClient);

/// Callback for when a interstitial "INSTALL" button is clicked.
typedef void (*ZPLADInterstitiaDidClickCallback)(
    ZPLADTypeInterstitialClientRef *interstitialClient);

/// Callback for when a interstitial video is closed
typedef void (*ZPLADInterstitialVideoDidCloseCallback)(
    ZPLADTypeInterstitialClientRef *interstitialClient);

/// Callback for when a interstitial completes end.
typedef void (*ZPLADInterstitialDidCompleteCallback)(
    ZPLADTypeInterstitialClientRef *interstitialClient);

/// Callback for when a reward video ad request was successfully loaded.
typedef void (*ZPLADRewardVideoDidReceivedAdCallback)(
    ZPLADTypeRewardVideoClientRef *rewardVideoClient);

/// Callback for when a reward video ad request failed.
typedef void (*ZPLADRewardVideoDidFailToReceiveAdWithErrorCallback)(
    ZPLADTypeRewardVideoRef *rewardVideoClient, const char *error);

/// Callback for when a reward video video has started to play.
typedef void (*ZPLADRewardVideoVideoDidStartPlayingCallback)(
    ZPLADTypeRewardVideoRef *rewardVideoClient);

/// Callback for when a reward video "INSTALL" button is clicked.
typedef void (*ZPLADRewardVideoDidClickCallback)(
    ZPLADTypeRewardVideoRef *rewardVideoClient);

typedef void (*ZPLADRewardVideoDidRewardCallback)(
    ZPLADTypeRewardVideoRef *rewardVideoClient);

/// Callback for when a reward video video is closed
typedef void (*ZPLADRewardVideoVideoDidCloseCallback)(
    ZPLADTypeRewardVideoRef *rewardVideoClient);

/// Callback for when a reward video completes end.
typedef void (*ZPLADRewardVideoDidCompleteCallback)(
    ZPLADTypeRewardVideoRef *rewardVideoClient);
