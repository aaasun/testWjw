//
//  timeToString.m
//  ZNW
//
//  Created by user on 12-2-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "timeToString.h"

@implementation timeToString

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
//返回年月日
+(NSString *)returnYeanMonthDay:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}

#pragma mark 返回月日
+(NSString *)returnMonthDay:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"MM-dd"];
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}

//返回年月日和时间
+(NSString *)returnYeanMonthDayAndTime:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}

//返回年月是和时间（包含秒）
+(NSString *)returnYEarMonthDayAndAllRightTime:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}


#pragma mark 只返回时间
+(NSString *)returnTime:(NSDate *)nsdate
{
//    NSDate *dat=nsdate;
//    NSTimeZone *zone=[NSTimeZone systemTimeZone];
//    NSInteger interval=[zone secondsFromGMTForDate:dat];
//    NSDate *tempLoacl=[dat dateByAddingTimeInterval:interval];
//    NSLog(@"直接获取时间：%@",tempLoacl);

    
    
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
//    [Formatter setDateFormat:@"HH:mm:ss"];
    [Formatter setDateFormat:@"HH:mm"];

    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
//    NSString *resultStr=[Formatter stringFromDate:tempLoacl];
    [Formatter release];
    return resultStr;
}

#pragma mark 返回月日和时间
+(NSString *)returnDayAndTime:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
//    [Formatter setDateFormat:@"MM-dd HH:mm:ss"];
    [Formatter setDateFormat:@"MM-dd HH:mm"];
    
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}

+(NSString *)returnYearMonthDayAndWeek:(NSDate *)nsdate
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *dd = [cal components:unitFlags fromDate:nsdate];
    
    
    NSString *yearStr = [NSString stringWithFormat:@"%d",[dd year]];
    NSString *MonthStr = [NSString stringWithFormat:@"%d",[dd month]];
    NSString *dayStr=[NSString stringWithFormat:@"%d",[dd day]];
    
    NSString *weekdayStr=@"";
    
    switch ([dd weekday]) {
        case 1:
        {
            weekdayStr=@"星期日";
        }
            break;
        case 2:
        {
            weekdayStr=@"星期一";
        }
            break;
        case 3:
        {
            weekdayStr=@"星期二";
        }
            break;
        case 4:
        {
            weekdayStr=@"星期三";
        }
            break;
        case 5:
        {
            weekdayStr=@"星期四";
        }
            break;
        case 6:
        {
            weekdayStr=@"星期五";
        }
            break;
        case 7:
        {
             weekdayStr=@"星期六";
        }
            break;
        default:
            break;
    }
   
    NSLog(@"xingqi:%@",weekdayStr);
    return [NSString stringWithFormat:@"%@年%@月%@日 %@",yearStr,MonthStr,dayStr,weekdayStr];
    return yearStr;
}
//日期添加一天
+(NSDate *)dayAdd:(NSInteger)inter date:(NSDate *)nsdate
{
    
//    NSDate *resultDate = [[[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([nsdate timeIntervalSinceReferenceDate] + 24*3600)] autorelease];
//    return resultDate;

    NSDate *resultDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([nsdate timeIntervalSinceReferenceDate] + 24*3600*inter)] ;
	return [resultDate autorelease];
}

//相应的字符串逐案换成NSDate类型
+(NSDate *)stringToDate:(NSString *)str
{   
    
//    NSDateFormatter *format=[[NSDateFormatter alloc] init];
//    [format setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];//location设置为中国	
//    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    
//    NSDate *resultDate=[format dateFromString:str];
//    return resultDate;

    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *resultDate=[format dateFromString:str];
    [format release];
    return resultDate;
}

//字符串转换成NSDate类型（包含时分秒）
+(NSDate *)stringToSpeDateAndTime:(NSString *)str
{
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"str:%@",str);
    
    NSDate *resultDate=[format dateFromString:str];
    NSLog(@"resultData:%@",resultDate);
    [format release];
    return resultDate;
}

//时间类型装换成正常的类型（+8小时时差）
+(NSDate *)dateToDate:(NSDate *)Wrongdate
{
    NSTimeZone *zone=[NSTimeZone systemTimeZone];
    NSInteger interval=[zone secondsFromGMTForDate:Wrongdate];
    NSDate *localeDate=[Wrongdate dateByAddingTimeInterval:interval];
    NSLog(@"直接获取时间：%@",localeDate);
    return localeDate;
}

#pragma mark 返回年份
+(NSString *)returnYear:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    //    [Formatter setDateFormat:@"MM-dd HH:mm:ss"];
    [Formatter setDateFormat:@"yyyy"];
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}

#pragma mark 传入nsdate返回月
+(NSString *)returnMonth:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    //    [Formatter setDateFormat:@"MM-dd HH:mm:ss"];
    [Formatter setDateFormat:@"MM"];
    
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}

#pragma mark 传入nsdate返回日
+(NSString *)returnDay:(NSDate *)nsdate
{
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    //    [Formatter setDateFormat:@"MM-dd HH:mm:ss"];
    [Formatter setDateFormat:@"dd"];
    
    
    NSString *resultStr=[Formatter stringFromDate:nsdate];
    [Formatter release];
    return resultStr;
}

+(NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    [dateFormatter release];
    return destDate;
}
+(NSString *)nowstring:(NSString*)nowstring oldstring:(NSString *)oldstring
{
    //NSLog(@"%@,%@",[stringtime substringWithRange:NSMakeRange(5, 2)],[stringtime substringWithRange:NSMakeRange(8, 2)]);
    
    if ([[nowstring substringWithRange:NSMakeRange(5, 2)]isEqualToString:[oldstring substringWithRange:NSMakeRange(5, 2)]] && [[nowstring substringWithRange:NSMakeRange(8, 2)]isEqualToString:[oldstring substringWithRange:NSMakeRange(8, 2)]]) {
        return @"当";
    }
    else
    {
        NSTimeInterval time=[[self dateFromString:nowstring] timeIntervalSinceDate:[self dateFromString:oldstring]];
        return [NSString stringWithFormat:@"%d",(int)time/3600/24];
        
    }
    
}

@end
