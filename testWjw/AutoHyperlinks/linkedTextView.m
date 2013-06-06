//
//  linkedTextView.m
//  CoreTextHyperlinkView
//
//  Created by front on 13-3-23.
//
//

#import "linkedTextView.h"

#import "JSTwitterCoreTextView.h"
#import "AHMarkedHyperlink.h"

@implementation linkedTextView

- (id)initWithFrame:(CGRect)frame withContent:(NSString *)text andTextFontSize:(CGFloat)fontSize andDelegate:(id<linkedTextViewDelegate>)delegate  andLinksColor:(UIColor *)linkColor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        
        //设置文本内容
        _text=text;
        
        //设置代理
        _delegate=delegate;
        
        NSString *font = @"Helvetica";
//        CGFloat size = 18.0;
        
        CGFloat paddingTop = 10.0;
        CGFloat paddingLeft = 10.0;
        
        _textView = [[[JSTwitterCoreTextView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0)] autorelease];
        _textView.textColor=[UIColor whiteColor];
        [_textView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [_textView setDelegate:self];
        [_textView setText:_text];
        [_textView setFontName:font];
        
        [_textView setFontSize:fontSize];
        
        [_textView setHighlightColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
        [_textView setBackgroundColor:[UIColor clearColor]];
        [_textView setPaddingTop:paddingTop];
        [_textView setPaddingLeft:paddingLeft];
        [_textView setLinkColor:linkColor];

        
        CGFloat height = [JSCoreTextView measureFrameHeightForText:text
                                                          fontName:font
                                                          fontSize:fontSize
                                                constrainedToWidth:_textView.frame.size.width - (paddingLeft * 2)
                                                        paddingTop:paddingTop
                                                       paddingLeft:paddingLeft];
        
        CGRect textFrame = [_textView frame];
        textFrame.size.height = height;
        [_textView setFrame:textFrame];
        
        _scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)] autorelease];
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.showsVerticalScrollIndicator=NO;
        [_scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [_scrollView setContentSize:_textView.frame.size];
        [_scrollView addSubview:_textView];
        
        [self addSubview:_scrollView];
        
        NSLog(@"scrollviewsize:%@",NSStringFromCGRect(_scrollView.frame));
        NSLog(@"contentSize:%@",NSStringFromCGSize(_scrollView.contentSize));
        NSLog(@"contentSize:%@",NSStringFromCGRect(_textView.frame));
        NSLog(@"height:%f",height);
        
    }
    return self;
}

#pragma mark JSCoreTextViewDelegate 方法
- (void)textView:(JSCoreTextView *)textView linkTapped:(AHMarkedHyperlink *)link
{
    if ([_delegate respondsToSelector:@selector(afterClickLinkedText:)]) {
        //通过代理函数，将点击到的链接通过url的形式传递出去
        [_delegate afterClickLinkedText:[link URL]];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)dealloc{
    [super dealloc];
    
//    [_scrollView release];
//    [_textView release];
}


@end
