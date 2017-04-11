//
//  XMGAudioFileTool.h
//  录音功能
//
//  Created by zhangzhifu on 2017/4/11.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGAudioFileTool : NSObject

// 将fromFile追加到toFile末尾.
+ (void)addAudioFile:(NSString *)fromFile toAudioFile:(NSString *)toFile savePath:(NSString *)savePath;


// 截取音频文件
+ (void)subAudioFile:(NSString *)audioFile fromTime:(NSTimeInterval)fromTime toTime:(NSTimeInterval)toTime savePath:(NSString *)savePath;
@end
