//
//  ZPLADInterstitial.m
//  ZPLAYAdsPlugin
//
//  Created by lgd on 2018/11/15.
//  Copyright © 2018 ZPLAYAds. All rights reserved.
//

#import "ZPLADInterstitial.h"
#import <UIKit/UIKit.h>

@interface ZPLADInterstitial() <PlayableAdsDelegate>
@end

@implementation ZPLADInterstitial

- (id)initWithInterstitialClientReference:(ZPLADTypeInterstitialClientRef *)interstitialClient
                                  adAppId:(NSString *)adAppId
                                 adUnitId:(NSString *)adUnitId {
    self = [super init];
    if (self){
        _interstitialClient = interstitialClient;
        _interstitial = [[PlayableAds alloc] initWithAdUnitID:adUnitId appID:adAppId];
        _interstitial.delegate = self;
    }
    return self;
}

- (void)dealloc {
    _interstitial.delegate = nil;
}

- (void)loadAd {
    [self.interstitial loadAd];
}

- (BOOL)isReady {
    return self.interstitial.isReady;
}

- (void)show {
    if(self.interstitial.isReady){
        [self.interstitial present];
    } else {
        NSLog(@"ZPLAYAdsPlugin: Interstitial is not ready to be shown.");
    }
}

- (void)setAutoload: (BOOL)autoload {
    self.interstitial.autoLoad = autoload;
}

- (void)setChannelId: (NSString *)channelId {
    self.interstitial.channelId = channelId;
}

#pragma mark ZPLYAds PlayableAdsDelegate implementation

/// Tells the delegate that succeeded to load ad.
- (void)playableAdsDidLoad:(PlayableAds *)ads {
    if (self.adReceivedCallback) {
        self.adReceivedCallback(self.interstitialClient);
    }
}

/// Tells the delegate that failed to load ad.
- (void)playableAds:(PlayableAds *)ads didFailToLoadWithError:(NSError *)error {
    if (self.adFailedCallback) {
        NSString *errorMsg = [NSString stringWithFormat:@"Failed to receive ad with error: %@", error];
        self.adFailedCallback(self.interstitialClient, [errorMsg cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

/// Tells the delegate that user starts playing the ad.
- (void)playableAdsDidStartPlaying:(PlayableAds *)ads {
    if (self.videoDidStartCallback) {
        self.videoDidStartCallback(self.interstitialClient);
    }
}

/// Tells the delegate that the ad is being fully played.
- (void)playableAdsDidEndPlaying:(PlayableAds *)ads {
    if (self.videoDidCloseCallback) {
        self.videoDidCloseCallback(self.interstitialClient);
    }
}

/// Tells the delegate that the ad did animate off the screen.
- (void)playableAdsDidDismissScreen:(PlayableAds *)ads {
    if (self.adDidCompleteCallback) {
        self.adDidCompleteCallback(self.interstitialClient);
    }
}

/// Tells the delegate that the ad is clicked
- (void)playableAdsDidClick:(PlayableAds *)ads {
    if (self.adClickedCallback) {
        self.adClickedCallback(self.interstitialClient);
    }
}

@end
