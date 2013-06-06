//
//  blockView.m
//  testWjw
//
//  Created by front on 13-3-25.
//  Copyright (c) 2013年 front. All rights reserved.
//

#import "blockView.h"

@implementation blockView

- (id)initWithFrame:(CGRect)frame block:(DBAvatouTouchEventBlock)blockControl
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //第三步
        _block=Block_copy(blockControl);
        
        //第四步（想在这个初始化方法里面执行，就直接调用，想在什么地方执行就在什么地方调用）
//        _block();
        
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        
        [self addGestureRecognizer:singleTap];
        
        [singleTap release];
        
    }
    return self;
}


-(void)singleTap:(UIGestureRecognizer *)gesture
{
    //第四步
    _block();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)dealloc
{
    [super dealloc];
    //第五步（最后释放掉）
    Block_release(_block);
    
}

@end
