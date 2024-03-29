//
//  SearchTextField.m
//  FeatherBlurSample
//
//  Created by Кирилл Сидоров on 15.11.2020.
//

#import <UIKit/UIKit.h>
#import "SearchTextField.h"
#import "Paths.h"

@interface SBHSearchTextField : UISearchTextField

@end

@implementation SearchTextField

+ (void)load {
	const char *path = [SBH_PATH cStringUsingEncoding:NSUTF8StringEncoding];
	dlopen(path, RTLD_NOW);
}

- (instancetype) init {
    self = [super init];
    if (self) {
        SBHSearchTextField *view = [NSClassFromString(@"SBHSearchTextField") alloc];
        view = [view initWithFrame:CGRectZero];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
        [[view.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
        [[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
        [[view.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
        [[view.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
        
        [view setPlaceholder:@"Search an app"];
    }
    return self;
}

@end
