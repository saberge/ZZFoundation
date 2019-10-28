//
//  ZZLocalized.h
//  AFNetworking
//
//  Created by laixian on 2019/10/9.
//

#import <Foundation/Foundation.h>

static NSString * const kAppLanguage = @"zzAppLanguage";

FOUNDATION_EXPORT NSString * const ZZLocalizedDidChangdeNoti;

// 简体中文
#define ZZLChinese_Hans @"zh-Hans"
// 英文
#define ZZLEnglish      @"en"


NS_ASSUME_NONNULL_BEGIN

static inline NSString *Localized(NSString *key){
    return [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:kAppLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil];
}

/*
 应用内多语言切换解决方案。
 1. 导入
 2. delegate 里面今早的initLanguage
 3. main 主工程下面新建语言文件
 */
@interface ZZLocalized : NSObject

@property (nonatomic ,strong) NSString *language;

+ (instancetype)shareInstance;

- (void)initLanguage;

@end

NS_ASSUME_NONNULL_END
