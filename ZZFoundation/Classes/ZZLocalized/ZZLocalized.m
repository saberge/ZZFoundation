//
//  ZZLocalized.m
//  AFNetworking
//
//  Created by laixian on 2019/10/9.
//

#import "ZZLocalized.h"
#import <objc/runtime.h>

NSString * const ZZLocalizedDidChangdeNoti = @"ZZLocalizedDidChangdeNoti";

@implementation ZZLocalized

- (void)initLanguage
{
    NSString *language=[self language];
    if (language.length>0) {
        
    }else{
        [self systemLanguage];
    }
}

- (void)systemLanguage
{
    NSString *languageCode = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"][0];
    if([languageCode hasPrefix:@"zh-Hant"]){
        languageCode = @"zh-Hant";//繁体中文
    }else if([languageCode hasPrefix:@"zh-Hans"]){
        languageCode = @"zh-Hans";//简体中文
    }else if([languageCode hasPrefix:@"pt"]){
        languageCode = @"pt";//葡萄牙语
    }else if([languageCode hasPrefix:@"es"]){
        languageCode = @"es";//西班牙语
    }else if([languageCode hasPrefix:@"th"]){
        languageCode = @"th";//泰语
    }else if([languageCode hasPrefix:@"hi"]){
        languageCode = @"hi";//印地语
    }else if([languageCode hasPrefix:@"en"]){
        languageCode = @"en";//英语
    }else{
        languageCode = @"en";//英语
    }
    [self setLanguage:languageCode];
}

- (NSString *)language
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kAppLanguage];
}

- (void)setLanguage:(NSString *)language
{
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:kAppLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:ZZLocalizedDidChangdeNoti object:nil];
    });
}

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    static ZZLocalized *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init] ;

    }) ;
    return instance ;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [ZZLocalized shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [ZZLocalized shareInstance];Class;
}


@end
