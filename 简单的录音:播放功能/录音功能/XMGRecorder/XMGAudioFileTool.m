//
//  XMGAudioFileTool.m
//  录音功能
//
//  Created by zhangzhifu on 2017/4/11.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import "XMGAudioFileTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation XMGAudioFileTool

+ (void)addAudioFile:(NSString *)fromFile toAudioFile:(NSString *)toFile savePath:(NSString *)savePath {
    // 1. 获取两个音频资源
    AVURLAsset *asset1 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:fromFile]];
    AVURLAsset *asset2 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:toFile]];
    
    // 2. 获取资源里面的音频轨道素材
    AVAssetTrack *track1 = [[asset1 tracksWithMediaType:AVMediaTypeAudio] firstObject];
    AVAssetTrack *track2 = [[asset2 tracksWithMediaType:AVMediaTypeAudio] firstObject];
    
    // 3. 创建一个合成器,并且在合成器里面添加一个空的音频轨道(可以追加音频轨道素材)
    AVMutableComposition *composition = [AVMutableComposition composition];
    AVMutableCompositionTrack *compositionTrack = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    
    [compositionTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, asset2.duration) ofTrack:track2 atTime:kCMTimeZero error:nil];
    [compositionTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, asset1.duration) ofTrack:track1 atTime:asset2.duration error:nil];
    
    // 4. 创建一个导出会话,配置相应的参数.
    AVAssetExportSession *session = [AVAssetExportSession exportSessionWithAsset:composition presetName:AVAssetExportPresetAppleM4A];
    // 针对于导出会话添加一些参数.
    session.outputURL = [NSURL fileURLWithPath:savePath];
    session.outputFileType = AVFileTypeAppleM4A;
    
    [session exportAsynchronouslyWithCompletionHandler:^{
        NSLog(@"导出完成");
    }];
}


+ (void)subAudioFile:(NSString *)audioFile fromTime:(NSTimeInterval)fromTime toTime:(NSTimeInterval)toTime savePath:(NSString *)savePath {
    // 1. 获取音频资源
    AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:audioFile]];
    
    // 2. 创建一个导出会话,配置相应的参数.
    AVAssetExportSession *session = [AVAssetExportSession exportSessionWithAsset:asset presetName:AVAssetExportPresetAppleM4A];
    // 针对于导出会话添加一些参数.
    session.outputURL = [NSURL fileURLWithPath:savePath];
    session.outputFileType = AVFileTypeAppleM4A;
    session.timeRange = CMTimeRangeFromTimeToTime(CMTimeMake(fromTime, 1), CMTimeMake(toTime, 1));
    
    [session exportAsynchronouslyWithCompletionHandler:^{
        NSLog(@"导出完成");
        
        AVAssetExportSessionStatus status = session.status;
    }];
}
@end
