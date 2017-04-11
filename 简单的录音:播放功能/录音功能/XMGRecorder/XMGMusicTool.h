//
//  XMGMusicTool.h
//  录音实验
//
//  Created by 王顺子 on 16/8/26.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Sington.h"

@interface XMGMusicTool : NSObject
singtonInterface;
/**
 *  播放歌曲
 */
- (AVAudioPlayer *)playAudioWith:(NSString *)audioPath;

/**
 *  恢复当前歌曲
 */
- (void)resumeCurrentAudio;

/**
 *  暂停歌曲
 */
- (void)pauseCurrentAudio;

/**
 *  停止歌曲
 */
- (void)stopCurrentAudio;

/**
 *  声音
 */
@property (nonatomic, assign) float volumn;

/**
 *  播放进度
 */
@property (nonatomic, assign, readonly) float progress;




@end
