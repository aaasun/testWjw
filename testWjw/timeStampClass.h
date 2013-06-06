//
//  timeStampClass.h
//  ZNW
//
//  Created by lls on 12-2-4.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//****时间戳转换的类


#import <Foundation/Foundation.h>

@interface timeStampClass : NSObject


//时间戳转换成相应的时间字符串类型
+(NSString *)toString:(NSInteger)timeStamp;
//判断是否是时间戳类型
+(BOOL)isStamp:(NSInteger)timeStamp;
//时间戳转换成相应的时间类型
+(NSDate *)toDate:(NSInteger)timeStamp;
//将date转换成String类型
+(NSString *)DatetoString:(NSDate *)timeDate;
//传入时间戳，返回格式化的时间差（例如：多少天之前，多少小时之前，多少分钟之前）
+(NSString *)returnDateBetween:(NSInteger)timeStamp;
//传入时间戳，返回特殊的格式化时间差（例如：几分钟之前，超过一小时，显示今天 几点多少 超过一天的用06-03 18:23）
+(NSString *)returnSpecialDateBetween:(NSInteger)timeStamp;
//传入时间字符串，返回特殊的格式化时间差（例如：几分钟之前，超过一小时，显示今天 几点多少 超过一天的用06-03 18:23）
+(NSString *)returnSpecialDateBetweenWithTimeStr:(NSString *)strTime;

#pragma mark 传入两个时间类型，返回两个时间类型的差
+(NSInteger)returnDayBetween:(NSDate *)date1 lateDate:(NSDate *)date2;

#pragma mark 传入两个时间字符串，和范围时间，查看是否在范围时间之内
+(BOOL)isContainsRange:(NSDate *)date1 andOtherDate:(NSDate *)date2 andRante:(NSInteger)timeSec;


//2013
#pragma mark 传入两个时间是否在一年以内
+(BOOL)isDateContainsYear:(NSDate *)date1 andOtherDate:(NSDate *)date2;

#pragma mark 传入两个时间是否在30天以内
+(BOOL)isDateContainsMonth:(NSDate *)date1 andOtherDate:(NSDate *)date2;

#pragma mark 传入两个时间是否在7天以内
+(BOOL)isDateContainsAweek:(NSDate *)date1 andOtherDate:(NSDate *)date2;
//2013

#pragma mark 传入时间类型，转换成时间戳
+(NSInteger)DateToTimeStamp:(NSDate *)date;

#pragma mark 获取当前时间的时间戳
+(NSInteger)getCurrentTimeStamp;

#pragma mark 返回day,用来做比较
+(NSInteger)returnDay:(NSDate *)date;
#pragma mark 返回day,用来做比较
+(NSInteger)returnYear:(NSDate *)date;
@end

