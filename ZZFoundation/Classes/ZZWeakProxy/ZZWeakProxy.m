//
//  ZZWeakProxy.m
//  AFNetworking
//
//  Created by laixian on 2019/10/19.
//

#import "ZZWeakProxy.h"

@interface ZZWeakProxy ()
@property (nonatomic, weak) id weakObject;
@end

@implementation ZZWeakProxy
- (instancetype)initWithObject:(NSObject *)object {
    self = [super init];
    if (self) {
        self.weakObject = object;
    }
    return self;
}

#pragma mark -

//Fast forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (!self.weakObject) {
//        NSAssert(false, @"why");
    }
    return self.weakObject;
}

//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    [anInvocation setTarget:self.weakObject];
//    [anInvocation invoke];
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    __strong id strongObject = self.weakObject;
//    if (strongObject) {
//        return [strongObject methodSignatureForSelector:aSelector];
//    } else {
//#if DEBUG == 1
//        //if return nil methodsignature, it will crash.
//        //this will force you to release proxy object
//        //before weakObject dealloc
//        return nil;
//#else
//        NSString *idSignature = [NSString stringWithUTF8String:@encode(id)];
//        NSString *selSignature = [NSString stringWithUTF8String:@encode(SEL)];
//        NSString *types = [NSString stringWithFormat:@"%@%@", idSignature, selSignature];
//        NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:types.UTF8String];
//        return methodSignature;
//#endif
//    }
//}
@end
