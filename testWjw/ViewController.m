//
//  ViewController.m
//  testWjw
//
//  Created by front on 13-3-25.
//  Copyright (c) 2013年 front. All rights reserved.
//

#import "ViewController.h"
#import <EventKit/EventKit.h>
#import "testAnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    blockView *bloView=[[blockView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) block:^{
//        NSLog(@"这里开始执行block了");
//    }];
//    
//    [self.view addSubview:bloView];
//    [bloView release];
//    
//    UIView *viewTemp=[[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 200)];
//    [self.view addSubview:viewTemp];
//    
//    NSLog(@"frame:%@  bounds:%@",NSStringFromCGRect(viewTemp.frame),NSStringFromCGRect(viewTemp.bounds));
//    
//    [viewTemp release];
    
    
//    UIImage *tempIamge;
//    [tempIamge stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>];
    
//    self.view.center
    
//    //刚开始这个地方算是默认的写法
//    [self.indicatView startAnimating];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //这里是执行的代码块，在这个代码块里面，可以先写一部分线程里面需要进行的操作
//        NSString *strImg=@"http://image.sjrjy.com/201011/291354164ea84578066309.jpg";
//        UIImage *img=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImg]]];
//        
//        //接下来这个dispatch_get_main_queue(),可以认为值进入到了主线程里面，开始执行主线程的相关操作
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"回到了主线程");
//            self.selfBigImg.image=img;
//            [self.indicatView removeFromSuperview];
//        });
//    });
    
    
//    NSData *data;
//    UIImage *image=[UIImage imageNamed:@"1.png"];
//    if (UIImagePNGRepresentation(image) == nil) {
//        data = UIImageJPEGRepresentation(image, 1);
//    } else {
//        
//        data = UIImagePNGRepresentation(image);
//    }
    
    
    //再添加一个自定义的使用ib的view
//    NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"ibView" owner:self options:nil];
//    viewTest=[array objectAtIndex:0];
//    [viewTest retain];
//    [viewTest.btnTest setTitle:@"尝试一下啊" forState:UIControlStateNormal];
//    [self.view addSubview:viewTest];
    
    
//    UIButton *btnTest=[UIButton buttonWithType:UIButtonTypeInfoDark];
//    btnTest.frame=CGRectMake(0, 400, 30, 50);
//    [btnTest addTarget:self action:@selector(afterClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnTest];
    
    
    
    //自己写一个block :
    //返回值(^block名称)(传递的参数,传递的参数)=^(参数类型 传递的参数){执行的代码;};
//    void (^myBlock)(int) = ^(int sum){
//        NSLog(@"AAA");
//    };
//    //下面是调用block；
//    myBlock(5);
    
	
    
    
    //这个地方使用一个全局变量试一下
//    arrData=[[NSMutableArray alloc] init];
//    __block int intResult=0;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        UIImage *img=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img.265g.com/img4/201303/201303270844558565.jpg"]]];
//        [arrData addObject:img];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            intResult=1;
//            NSLog(@"回到了主线程");
//            NSLog(@"arrData count:%d",[arrData count]);
//        });
//    });
//
//    NSLog(@"result:%d",intResult);
    
    //尝试链接的控件
//    linkedTextView *textView=[[linkedTextView alloc] initWithFrame:CGRectMake(0, 0, 100, 480) withContent:@"接下来是一个包含链接的文字了‘ www.baidu.com ’" andTextFontSize:13.0 andDelegate:self andLinksColor:[UIColor redColor]];
//    [self.view addSubview:textView];
//    [textView release];
//    
//    UIButton *btnTemp=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
//    [self.view addSubview:btnTemp];
//    [btnTemp addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [btnTemp release];
    
//    UISearchBar *searchbar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    [self.view addSubview:searchbar];
//    searchView=[[UISearchDisplayController alloc] initWithSearchBar:searchbar contentsController:self];
//    searchView.delegate=self;

    
//    NSMutableDictionary *tempDic=[[NSMutableDictionary alloc] init];
//    NSMutableArray *arrTemp=[[NSMutableArray alloc] init];
//    for (int i=0; i<8; i++) {
//        [arrTemp addObject:[NSString stringWithFormat:@"%d",i]];
//    }
//    
//    [tempDic setObject:arrTemp forKey:@"1"];
//    
//    [arrTemp release];
//    
//    NSMutableArray *atemp=[tempDic objectForKey:@"1"];
//    [atemp removeLastObject];
//    NSLog(@"全部的数据：%@",[tempDic objectForKey:@"1"]);
    
//    NSMutableArray *arr1=[[NSMutableArray alloc] init];
////    NSMutableArray *arr2=[[NSMutableArray alloc] init];
//    NSArray *arr=[[NSArray alloc] initWithObjects:@"1",@"1",@"1",@"1", nil];
//    [arr1 addObjectsFromArray:arr];
////    [arr2 addObjectsFromArray:arr];
//    NSMutableArray *arr2=[[NSMutableArray alloc] initWithArray:arr1];
//    
//    NSLog(@"arr:%@ arr1:%@ arr2:%@",arr,arr1,arr2);
//    [arr release];
//    [arr1 removeLastObject];
//    NSLog(@"arr1:%@ arr2:%@",arr1,arr2);
    
//    
//    NSDate *startDate=[timeToString dayAdd:1 date:[NSDate date]];
//    NSDate *endDate=[timeToString dayAdd:2 date:[NSDate date]];
//
//    EKEventStore *store = [[EKEventStore alloc] init];
//    EKEvent *event=[EKEvent eventWithEventStore:store];
//    event.calendar=store.defaultCalendarForNewEvents;
//    event.title=@"title";
//    event.startDate=startDate;
//    event.endDate=endDate;
//    event.location=@"location";
//    event.alarms=[NSArray arrayWithObjects:[EKAlarm alarmWithRelativeOffset:-300], nil];
//    
//    NSError *error;
//    if ([store saveEvent:event span:EKSpanThisEvent error:&error])
//    {
//        NSLog(@"插入成功");
//    }else{
//        NSLog(@"失败");
//    }
   
    
//    EKEventStore *eventDB = [[EKEventStore alloc] init];
//    __block NSInteger curNum = 0;
//    [eventDB requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
//        // handle access here
//        if (granted == YES) {
//            EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB];
//            NSDate *startDate=[timeToString stringToSpeDateAndTime:@"2013-05-24 17:30:00"];
//            NSDate *endDate=[timeToString stringToSpeDateAndTime:@"2013-05-24 17:31:00"];
//            myEvent.availability=EKEventAvailabilityBusy;
//            myEvent.title     = @"title";
//            myEvent.startDate = startDate;
//            myEvent.endDate   = endDate;
//            myEvent.allDay = NO;
//            myEvent.location = @"北京";
//            myEvent.notes =@"提醒";
//            [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]];
//            NSError *err;
//            //commit:yes为单挑插入， commit:NO为批量插入，需要再最后执行[eventDB commit:nil]
//            BOOL result = [eventDB saveEvent:myEvent span:EKSpanThisEvent commit:YES error:&err];
//            if (result) {
//                NSLog(@"OK");
//            }else{
//                NSLog(@"failed");
//            }
//        }
//    }];
    
    //用户交互的时候，可以提示进行的进度
//    while (curNum < countNum) {
//        NSLog(@"curNum = %d, contNum = %d", curNum, countNum);
//        continue;
//        
//    }
    
//    [eventDB commit:nil];
//    [eventDB release];
    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //这里面是线程处理数据
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //这里面是主线程更新数据
            
        });
    });
    
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"searchString:%@",searchString);
    return YES;
}

-(void)clickBtn:(id)sender
{
    testAnimationViewController *controller=[[testAnimationViewController alloc] initWithNibName:@"testAnimationViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

//点击过了链接的文字之后执行的代理方法
-(void)afterClickLinkedText:(NSURL *)url
{
    NSLog(@"url:%@",url);
}

-(void)afterClick:(UIButton *)sender
{
    [viewTest.btnTest setTitle:@"点击了" forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [viewTest release];
    [_selfBigImg release];
    [_indicatView release];
    [_mySearchBar release];
    [super dealloc];
}
@end
