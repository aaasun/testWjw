//
//  timeToString.h
//  ZNW
//
//  Created by user on 12-2-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//****date类型与NSString 类型的转换类


#import <Foundation/Foundation.h>

@interface timeToString : NSObject

+(NSString *)returnYearMonthDayAndWeek:(NSDate *)nsdate;

#pragma mark 只返回时间
+(NSString *)returnTime:(NSDate *)nsdate;

#pragma mark 返回月日和时间
+(NSString *)returnDayAndTime:(NSDate *)nsdate;
#pragma mark 返回年月日
+(NSString *)returnYeanMonthDay:(NSDate *)nsdate;
#pragma mark 返回月日
+(NSString *)returnMonthDay:(NSDate *)nsdate;


//返回年月日和时间（不包含秒）
+(NSString *)returnYeanMonthDayAndTime:(NSDate *)nsdate;
//返回年月是和时间（包含秒）
+(NSString *)returnYEarMonthDayAndAllRightTime:(NSDate *)nsdate;


//日期添加一天
+(NSDate *)dayAdd:(NSInteger)inter date:(NSDate *)nsdate;
//字符串转换成NSDate类型
+(NSDate *)stringToDate:(NSString *)str;
//字符串转换成NSDate类型（包含时分秒）
+(NSDate *)stringToSpeDateAndTime:(NSString *)str;

//时间类型装换成正常的类型（+8小时时差）
+(NSDate *)dateToDate:(NSDate *)Wrongdate;

#pragma mark 返回年份
+(NSString *)returnYear:(NSDate *)nsdate;

#pragma mark 传入nsdate返回月
+(NSString *)returnMonth:(NSDate *)nsdate;

#pragma mark 传入nsdate返回日
+(NSString *)returnDay:(NSDate *)nsdate;

+(NSDate *)dateFromString:(NSString *)dateString;

+(NSString *)nowstring:(NSString*)nowstring oldstring:(NSString *)oldstring;

@end

