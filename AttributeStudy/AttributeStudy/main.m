//
//  main.m
//  AttributeStudy
//
//  Created by Harry Houdini on 2018/5/23.
//  Copyright © 2018年 Harry Houdini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/**
 *  constructor 修饰的函数会在main之前执行
 *  destructor  修饰的函数会在main之后执行
 */

//执行顺序 load -> beforeMain -> main -> afterMain

//__attribute__((constructor))
//static void beforeMain(void) {
//    NSLog(@"beforeMain");
//}
//
//__attribute__((destructor))
//static void afterMain(void) {
//    NSLog(@"afterMain");
//}
//
//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        NSLog(@"main");
//        return 0;
//    }
//}

