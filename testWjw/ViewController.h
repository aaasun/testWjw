//
//  ViewController.h
//  testWjw
//
//  Created by front on 13-3-25.
//  Copyright (c) 2013年 front. All rights reserved.
//


#import "blockView.h"
#import "ibView.h"

#import "linkedTextView.h"

#import <QuartzCore/QuartzCore.h>
#import "timeToString.h"
#import "timeStampClass.h"


#import <UIKit/UIKit.h>
#import <dispatch/dispatch.h>

@interface ViewController : UIViewController<linkedTextViewDelegate,UISearchDisplayDelegate>
{
    ibView *viewTest;
    
    NSMutableArray *arrData;
    
//    CAScrollLayer
    
    UISearchDisplayController *searchView;
    
}

@property (retain, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (retain, nonatomic) IBOutlet UIImageView *selfBigImg;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *indicatView;

@end
