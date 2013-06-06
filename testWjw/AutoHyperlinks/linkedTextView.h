//
//  linkedTextView.h
//  CoreTextHyperlinkView
//
//  Created by front on 13-3-23.
//
//
//对添加链接功能的label和uiscrollview的一个封装(这个是自己的一个简单的封装)



@protocol linkedTextViewDelegate <NSObject>

//点击过了链接的文字之后执行的代理方法
-(void)afterClickLinkedText:(NSURL *)url;

@end


#import <UIKit/UIKit.h>
#import "JSCoreTextView.h"

@class JSTwitterCoreTextView;

@interface linkedTextView : UIView<JSCoreTextViewDelegate>
{
    JSTwitterCoreTextView *_textView;
    UIScrollView *_scrollView;
    
    NSString *_text;
    
    id<linkedTextViewDelegate> _delegate;
}

- (id)initWithFrame:(CGRect)frame withContent:(NSString *)text andTextFontSize:(CGFloat)fontSize andDelegate:(id<linkedTextViewDelegate>)delegate andLinksColor:(UIColor *)linkColor;

@end
