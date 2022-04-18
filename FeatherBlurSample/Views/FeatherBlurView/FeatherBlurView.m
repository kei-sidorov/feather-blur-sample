//
//  FeatherBlurView.m
//  FeatherBlurSample
//
//  Created by Кирилл Сидоров on 04.11.2020.
//

#import "FeatherBlurView.h"
#import "Paths.h"

@interface SBHFeatherBlurView : UIView
- (instancetype) initWithRecipe:(int)arg1;
@end

@implementation FeatherBlurView

+ (void)load {
    const char *path = [SBF_PATH cStringUsingEncoding:NSUTF8StringEncoding];
    dlopen(path, RTLD_NOW);
}

- (instancetype) init {
    self = [super init];
    if (self) {
        SBHFeatherBlurView *view = [NSClassFromString(@"SBFFeatherBlurView") alloc];
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
