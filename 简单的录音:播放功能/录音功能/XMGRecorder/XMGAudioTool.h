//
//  XMGAudioTool.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/25.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Sington.h"


// 定义block类型.
typedef void(^SuccessType)(BOOL ret);

@interface XMGAudioTool : NSObject
singtonInterface;

/**
 *  开始录音
 */
- (void)beginRecordWithRecordPath: (NSString *)recordPath;
/**
 *  结束录音
 */
- (void)endRecord;
/**
 *  暂停录音
 */
- (void)pauseRecord;

/**
 *  删除录音
 */
- (void)deleteRecord;

/**
 *  重新录音
 */
- (void)reRecord;

/**
 *  录音文件路径
 */
@property (nonatomic, copy, readonly) NSString *recordPath;


// 更新音频测量,可以获得声音分贝等信息.
- (void)updateMeters;

// 返回给定声道的分贝峰值.
- (float)peakPowerForChannel0;

@end
