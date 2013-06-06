//
//  ibView.m
//  testWjw
//
//  Created by front on 13-3-25.
//  Copyright (c) 2013年 front. All rights reserved.
//

#import "ibView.h"

@implementation ibView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [_btnTest release];
    [super dealloc];
}
- (IBAction)clickBtn:(id)sender {
    NSLog(@"点击了按钮了");
}
@end
