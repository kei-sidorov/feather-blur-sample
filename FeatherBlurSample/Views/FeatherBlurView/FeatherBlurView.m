//
//  FeatherBlurView.m
//  FeatherBlurSample
//
//  Created by Кирилл Сидоров on 04.11.2020.
//

#import "FeatherBlurView.h"
#import <dlfcn.h>

#define SBH_PATH @"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/SpringBoardHome.framework/SpringBoardHome"

@interface SBHFeatherBlurView : UIView
- (instancetype) initWithRecipe:(int)arg1;
@end

@implementation FeatherBlurView

+ (void)load {
    const char *path = [SBH_PATH cStringUsingEncoding:NSUTF8StringEncoding];
    dlopen(path, RTLD_NOW);
}

- (instancetype) init {
    self = [super init];
    if (self) {
        SBHFeatherBlurView *view = [NSClassFromString(@"SBHFeatherBlurView") alloc];
        view = [view initWithRecipe:0x2];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
        [[view.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
        [[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
        [[view.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
        [[view.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
    }
    return self;
}

@end
