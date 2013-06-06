//
//  timeStampClass.m
//  ZNW
//
//  Created by lls on 12-2-4.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
#import "timeStampClass.h"
#import "timeToString.h"

@implementation timeStampClass

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

//时间戳类型转换成相应的时间字符串
+(NSString *)toString:(NSInteger)timeStamp
{
    //先转换成Date
    NSDate *tempDate=[timeStampClass toDate:timeStamp];
    //再装换成string类型
    if (tempDate==nil) {
        return  nil;
    }else
    {
        NSString *resultStr=[timeStampClass DatetoString:tempDate];
        return resultStr;
    }
}

//判断是否是时间戳类型
+(BOOL)isStamp:(NSInteger)timeStamp
{
    return YES;
}

//时间戳转换成相应的时间类型
+(NSDate *)toDate:(NSInteger)timeStamp
{
    if ([timeStampClass isStamp:timeStamp]) {
        NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
//        NSTimeZone *zone=[NSTimeZone systemTimeZone];
//        NSInteger interval=[zone secondsFromGMTForDate:confromTimesp];
//        NSDate *localeDate=[confromTimesp dateByAddingTimeInterval:interval];
//        NSLog(@"直接获取时间：%@",localeDate);
//        
//        NSLog(@"confromtimesp=%@",localeDate);
//        return localeDate;
        return confromTimesp;
    }else
    {
        return  nil;
    }
}

//将date转换成String类型
+(NSString *)DatetoString:(NSDate *)timeDate
{
    if (timeDate==nil) {
        return nil;
    }
    NSDateFormatter *tempFormater=[[NSDateFormatter alloc] init];
    [tempFormater setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSString *resultStr=[tempFormater stringFromDate:timeDate];
    [tempFormater release];
    return resultStr;
}

//传入时间戳，返回格式化的时间差（例如：多少天之前，多少小时之前）
+(NSString *)returnDateBetween:(NSInteger)timeStamp
{
    //GTC时间转换成本地时间
//    NSDate *dat=[NSDate date];
//    NSTimeZone *zone=[NSTimeZone systemTimeZone];
//    NSInteger interval=[zone secondsFromGMTForDate:dat];
//    NSDate *localeDate=[dat dateByAddingTimeInterval:interval];
//    NSLog(@"直接获取时间：%@",localeDate);
    
    
    //jingbo项目里面直接是用本地的时间了
    NSDate *localeDate=[NSDate date]; 
    
    NSString *timeString=@"";
    
    //NSDate *dat=[NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[localeDate timeIntervalSince1970]*1;
    
    NSDate *d=[timeStampClass toDate:timeStamp];
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    NSTimeInterval cha=fabs(now-late);
    if (cha/3600<1) {
        timeString=[NSString stringWithFormat:@"%f",cha/60];
        timeString=[timeString substringToIndex:timeString.length-7];
        if (cha/60<3) {
            timeString=@"刚刚";
        }else
        {
            if ([timeString isEqualToString:@"0"]) {
                timeString=@"1";
            }
            timeString=[NSString stringWithFormat:@"%@分钟前",timeString];
        }
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    if (cha/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    return timeString;
}

//传入时间戳，返回特殊的格式化时间差（例如：几分钟之前，超过一小时，显示今天 几点多少 超过一天的用06-03 18:23）
+(NSString *)returnSpecialDateBetween:(NSInteger)timeStamp
{
    NSLog(@"%d",timeStamp);
    //GTC时间转换成本地时间
//    NSDate *dat=[NSDate date];
//    NSTimeZone *zone=[NSTimeZone systemTimeZone];
//    NSInteger interval=[zone secondsFromGMTForDate:dat];
//    NSDate *localeDate=[dat dateByAddingTimeInterval:interval];
//    NSLog(@"直接获取时间：%@",localeDate);
    
    
    //jingbo项目里面直接是用本地的时间了
    NSDate *localeDate=[NSDate date];
    
    NSString *timeString=@"";
    
    //NSDate *dat=[NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[localeDate timeIntervalSince1970]*1;
    
    NSDate *d=[timeStampClass toDate:timeStamp];
    NSLog(@"d:%@",d);
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    NSLog(@"%f",late);
    NSLog(@"%f",now);
    NSTimeInterval cha=fabs(now-late);
    if (cha/3600<1) {
        timeString=[NSString stringWithFormat:@"%f",cha/60];
        timeString=[timeString substringToIndex:timeString.length-7];
        //直接取 分钟之前的数据
        timeString=[NSString stringWithFormat:@"%@分钟前",timeString];
    }
    if (cha/3600>1&&cha/86400<1) {
        //本天以内
        NSInteger StampDay=[timeStampClass returnDay:d];
        NSInteger NowDay=[timeStampClass returnDay:localeDate];
        NSLog(@"NowDay%d",NowDay);
        NSLog(@"StampDay%d",StampDay);
        
        if (NowDay==StampDay) {
            //同一天的
            //day相等
            timeString=[timeToString returnTime:d];        
        }else if(NowDay>StampDay)
        {
            //超过一天的
            //以前的数据
            timeString=[timeToString returnDayAndTime:d];
        }
    }
    if (cha/86400>1&&cha/(365*86400)<1) {
        //一年以内，还要再判断是否是同一年份
        NSInteger stamYear=[timeStampClass returnYear:d];
        NSInteger nowYear=[timeStampClass returnYear:localeDate];
        
        if (nowYear==stamYear) {
            //同一年
            timeString=[timeToString returnDayAndTime:d];
        }else
        {
            //不同一年的
            timeString=[timeToString returnYeanMonthDayAndTime:d];
        }
    }
    if (cha/(365*86400)>1)
    {
        //一年以外
//        timeString=[timeToString returnYeanMonthDay:d];
        timeString=[timeToString returnYeanMonthDayAndTime:d];
    }    
    return timeString;
}

//传入时间字符串，返回特殊的格式化时间差（例如：几分钟之前，超过一小时，显示今天 几点多少 超过一天的用06-03 18:23）
+(NSString *)returnSpecialDateBetweenWithTimeStr:(NSString *)strTime
{
    NSLog(@"%@",strTime);
    //GTC时间转换成本地时间
    NSDate *dat=[NSDate date];
    NSTimeZone *zone=[NSTimeZone systemTimeZone];
    NSInteger interval=[zone secondsFromGMTForDate:dat];
    NSDate *localeDate=[dat dateByAddingTimeInterval:interval];
    NSLog(@"直接获取时间：%@",localeDate);
    
    //jingbo项目里面直接是用本地的时间了
//    NSDate *localeDate=[NSDate date];
    NSLog(@"%@",[NSDate date]);
    
    NSString *timeString=@"";
    
    //NSDate *dat=[NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[localeDate timeIntervalSince1970]*1;

    NSDate *d=[timeToString stringToSpeDateAndTime:strTime];
    NSLog(@"strTime:%@",strTime);
//    NSDate *d=[timeStampClass toDate:timeStamp];
    NSLog(@"d:%@",d);
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    NSLog(@"%f",late);
    NSLog(@"%f",now);
    NSTimeInterval cha=fabs(now-late);
    if (cha/3600<1) {
        timeString=[NSString stringWithFormat:@"%f",cha/60];
        timeString=[timeString substringToIndex:timeString.length-7];
        //直接取 分钟之前的数据
        timeString=[NSString stringWithFormat:@"%@分钟前",timeString];
    }
    if (cha/3600>1&&cha/86400<1) {
        //本天以内
        NSInteger StampDay=[timeStampClass returnDay:d];
        NSInteger NowDay=[timeStampClass returnDay:localeDate];
        NSLog(@"NowDay%d",NowDay);
        NSLog(@"StampDay%d",StampDay);
        
        if (NowDay==StampDay) {
            //同一天的
            //day相等
            timeString=[timeToString returnTime:d];        
        }else if(NowDay>StampDay)
        {
            //超过一天的
            //以前的数据
            timeString=[timeToString returnDayAndTime:d];
        }
    }
    if (cha/86400>1&&cha/(365*86400)<1) {
        //一年以内，还要再判断是否是同一年份
        NSInteger stamYear=[timeStampClass returnYear:d];
        NSInteger nowYear=[timeStampClass returnYear:localeDate];
        
        if (nowYear==stamYear) {
            //同一年
            timeString=[timeToString returnDayAndTime:d];
        }else
        {
            //不同一年的
            timeString=[timeToString returnYeanMonthDayAndTime:d];
        }
    }
    if (cha/(365*86400)>1)
    {
        //一年以外
        //        timeString=[timeToString returnYeanMonthDay:d];
        timeString=[timeToString returnYeanMonthDayAndTime:d];
    }    
    return timeString;
}

+(NSInteger)returnDayBetween:(NSDate *)date1 lateDate:(NSDate *)date2
{
	NSTimeInterval time1=[date1 timeIntervalSince1970]*1;
	NSTimeInterval time2=[date2 timeIntervalSince1970]*1;
	NSTimeInterval cha=fabs(time2-time1);
	return cha/86400;	
}

#pragma mark 传入两个时间字符串，和范围时间，查看是否在范围时间之内
+(BOOL)isContainsRange:(NSDate *)date1 andOtherDate:(NSDate *)date2 andRante:(NSInteger)timeSec
{
    NSTimeInterval time1=[date1 timeIntervalSince1970]*1;
	NSTimeInterval time2=[date2 timeIntervalSince1970]*1;
    NSTimeInterval cha=fabs(time2-time1);
    return !(cha>timeSec);
}

#pragma mark 传入两个时间是否在一年以内
+(BOOL)isDateContainsYear:(NSDate *)date1 andOtherDate:(NSDate *)date2
{
    return [timeStampClass isContainsRange:date1 andOtherDate:date2 andRante:365*24*3600];
}

#pragma mark 传入两个时间是否在30天以内
+(BOOL)isDateContainsMonth:(NSDate *)date1 andOtherDate:(NSDate *)date2
{
    return [timeStampClass isContainsRange:date1 andOtherDate:date2 andRante:30*24*3600];
}

#pragma mark 传入两个时间是否在7天以内
+(BOOL)isDateContainsAweek:(NSDate *)date1 andOtherDate:(NSDate *)date2
{
    return [timeStampClass isContainsRange:date1 andOtherDate:date2 andRante:7*24*3600];
}



#pragma mark 返回day,用来做比较
+(NSInteger)returnDay:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];  
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |  
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];  
    NSLog(@"date:%@",date);
    
    NSLog(@"%d",[comps day]);
    
    //20120625 memory lyf
    [calendar release];
    return [comps day];
}

#pragma mark 返回day,用来做比较
+(NSInteger)returnYear:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];  
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |  
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];  
    NSLog(@"date:%@",date);
    
    //20120711 memory
    [calendar release];
    
    NSLog(@"%d",[comps year]);
    return [comps year];
}

#pragma mark 传入时间类型，转换成时间戳
+(NSInteger)DateToTimeStamp:(NSDate *)date
{    
    NSInteger result=[date timeIntervalSince1970];
    NSLog(@"result:%d",result);
    
    return result;
}

#pragma mark 获取当前时间的时间戳
+(NSInteger)getCurrentTimeStamp
{
    return [[NSDate date] timeIntervalSince1970];
}

@end
