//
//  ViewController.m
//  AttributeStudy
//
//  Created by Harry Houdini on 2018/5/23.
//  Copyright © 2018年 Harry Houdini. All rights reserved.
//

#import "ViewController.h"
#import "StudyModel.h"

typedef struct {
    CGFloat x, y, width, height;
} TheRect;
typedef struct __attribute__((objc_boxable)) {
    CGFloat x, y, width, height;
} FWRect;

static void cleanUpBlock(__strong void(^*block)(void)) {
    (*block)();
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self boxAble];
    [self cleanUpStudy];
    [self studyOverloadable];
    [self studyModel];
}

-(void)boxAble {
    TheRect rect1 = {1, 2, 3, 4};
    NSValue *value1 = @(rect1);
    FWRect rect2 = {1, 2, 3, 4};
    NSValue *value2 = @(rect2);
    NSLog(@"%@ %@",value1,value2);
}

-(void)cleanUpStudy {
    __strong void(^block)(void) __attribute__((cleanup(cleanUpBlock))) = ^{
        NSLog(@"这句代码在作用域(cleanUpStudy)最后执行");
    };
    NSLog(@"开始学习");
}

-(void)studyOverloadable {
    overloadable(3);
    overloadable(@(1));
    overloadable(@"char");
}

-(void)studyModel {
    StudyModel *studyModel = [[StudyModel alloc] initObject];
    [studyModel deprecated];//会出现弃用提示
    [studyModel availability];//由于我设置了 11.0 后被废除，所以编译会报错
    [studyModel unavailable];//设置了不能被使用，所以编译会报错
    NSInteger i = [studyModel warnUnusedResult];
    NSLog(@"%@",[StudyModel class]);//设置了runtimeName，所以这里不再是"StudyModel"输出
}

/**
 *  方法重载
 *  只能在C函数上使用
 *  参数不同就是不同方法
 */
__attribute__((overloadable)) void overloadable(int number) {
    NSLog(@"int");
}
__attribute__((overloadable)) void overloadable(NSNumber *number) {
    NSLog(@"NSNumber");
}
__attribute__((overloadable)) void overloadable(NSString *sting) {
    NSLog(@"NSString");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
