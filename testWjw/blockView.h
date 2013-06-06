//
//  blockView.h
//  testWjw
//
//  Created by front on 13-3-25.
//  Copyright (c) 2013年 front. All rights reserved.
//
//使用block作为参数的一个示例

//block的使用的简单的一个示例的总结：1、定义一个block： 2、定义一个block变量 3、通过Block_copy(传递进来的变量) 4、通过【后面这个是定义出来的block的变量】_block()来调用block执行传递进来的块的代码 5、通过Block_release(传递进来的变量)来释放【Block_copy()和Block_release()要成对出现】

//第一步
typedef void(^DBAvatouTouchEventBlock)();

#import <UIKit/UIKit.h>

@interface blockView : UIView
{
    //第二步
    DBAvatouTouchEventBlock _block;
}

- (id)initWithFrame:(CGRect)frame block:(DBAvatouTouchEventBlock)blockControl;

@end
