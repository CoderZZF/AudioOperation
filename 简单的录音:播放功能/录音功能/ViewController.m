//
//  ViewController.m
//  录音功能
//
//  Created by 王顺子 on 16/12/9.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "XMGAudioTool.h"
#import "XMGMusicTool.h"
#import "XMGAudioFileTool.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)beginRecord:(id)sender {
    [[XMGAudioTool shareInstance] beginRecordWithRecordPath:@"/Users/zhangzhifu/Desktop/test2.m4a"];
}

- (IBAction)endRecord:(id)sender {

    [[XMGAudioTool shareInstance] endRecord];

}
- (IBAction)deleteRecord:(id)sender {
    [[XMGAudioTool shareInstance] deleteRecord];

}
- (IBAction)playRecord:(id)sender {
    [[XMGMusicTool shareInstance] playAudioWith:@"/Users/zhangzhifu/Desktop/test.m4a"];
    
}

- (IBAction)export:(id)sender {
//    [XMGAudioFileTool addAudioFile:@"/Users/zhangzhifu/Desktop/test.m4a" toAudioFile:@"/Users/zhangzhifu/Desktop/test2.m4a" savePath:@"/Users/zhangzhifu/Desktop/test3.m4a"];
    [XMGAudioFileTool subAudioFile:@"/Users/zhangzhifu/Desktop/test.m4a" fromTime:1 toTime:2 savePath:@"/Users/zhangzhifu/Desktop/test4.m4a"];
}

@end
