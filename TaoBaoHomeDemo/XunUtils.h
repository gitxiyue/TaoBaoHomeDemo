//
//  XunUtils.h
//  
//
//  Created by yunchu on 14/10/24.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//版本号
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

//宽高
#define SCREEN_W ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_H ([[UIScreen mainScreen] bounds].size.height)

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define RGB(R/*红*/, G/*绿*/, B/*蓝*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1]

@interface XunUtils : NSObject
/**
 *  字符串转Date
 *
 *  @param str 'yyyy-MM-dd HH:mm:ss'
 *
 *  @return NSDate
 */
+ (NSDate *)strToDate:(NSString *)str;
/**
 *  <#Description#>
 *
 *  @param time <#time description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time;
/**
 *  <#Description#>
 *
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithOriginalName:(NSString *)imageName;
/**
 *  <#Description#>
 *
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithStretchableName:(NSString *)imageName;
/**
 *  正则判断字符串是否是中文
 *
 *  @param str
 *  @return BOOL
 */
+ (BOOL)isChinese:(NSString *)str;

+ (void)show:(nullable NSString *)msg;
@end
