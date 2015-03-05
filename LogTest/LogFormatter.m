//
//  LogFormatter.m
//  LogTest
//
//  Created by zhangjunbo on 15/3/5.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import "LogFormatter.h"

@implementation LogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    return [NSString stringWithFormat:@"%@ [%@][%@|%@|%@][%@|%@|%@]:%@",
            [self getTime:logMessage->_timestamp],
            [self getLevelString:logMessage->_flag],
            logMessage->_threadName,
            logMessage->_threadID,
            logMessage->_queueLabel,
            [logMessage fileName],
            logMessage->_function,
            @(logMessage->_line),
            logMessage->_message];
}

- (NSString *)getTime:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    return [dateFormatter stringFromDate:[NSDate date]];
}

- (NSString *)getLevelString:(DDLogFlag)flag {
    NSString *levelString;
    switch (flag) {
        case DDLogFlagError:
            levelString = @"Error";
            break;
        case DDLogFlagWarning:
            levelString = @"Warning";
            break;
        case DDLogFlagInfo:
            levelString = @"Info";
            break;
        case DDLogFlagDebug:
            levelString = @"Debug";
            break;
        case DDLogFlagVerbose:
            levelString = @"Verbose";
            break;
            
        default:
            break;
    }
    
    return levelString;
}

@end
