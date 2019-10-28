//
//  ZZMarcs.h
//  AFNetworking
//
//  Created by laixian on 2019/10/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static inline BOOL zzCheckModelClass(Class classModel ,NSObject *model){
    BOOL isCorrect = [model isKindOfClass:classModel];
    assert(isCorrect);
    return isCorrect;
}

// 循环引用
#define zzweakify(var) __weak typeof(var) ZZWeak_##var = var;
#define zzstrongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = ZZWeak_##var; \
_Pragma("clang diagnostic pop")


@interface ZZMarcs : NSObject

@end

NS_ASSUME_NONNULL_END
