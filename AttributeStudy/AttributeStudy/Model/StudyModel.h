//
//  StudyModel.h
//  AttributeStudy
//
//  Created by Harry Houdini on 2018/5/23.
//  Copyright © 2018年 Harry Houdini. All rights reserved.
//

#import <Foundation/Foundation.h>

__attribute__((objc_subclassing_restricted))//指定不能有子类
__attribute__((objc_runtime_name("ju9e892fy9m23icr9")))//设定在runtime时候的名字
@interface StudyModel : NSObject

/**
 *  指定为默认的初始化方式
 */
-(instancetype)initObject __attribute__((objc_designated_initializer));
//-(instancetype)initObject NS_DESIGNATED_INITIALIZER;//可以直接使用系统的宏，效果同上

/**
 *  弃用提示
 */
-(void)deprecated __attribute__((deprecated("已经被弃用了")));
//-(void)deprecated DEPRECATED_ATTRIBUTE; //可以直接使用系统定义的宏表示弃用

/**
 *  版本范围
 *  1.表示系统
 *  2.表示引入的版本号
 *  3.表示弃用的版本号
 *  4.表示不再使用的版本号
 *  5.提示信息
 */
-(void)availability __attribute__((availability(ios, introduced = 8_0, deprecated = 10_0, obsoleted = 11_0, message = "8.0开始使用，10.0开始不建议使用，11.0废除")));
//-(void)availability NS_AVAILABLE_IOS(11.0);//NS_AVAILABLE_IOS 这个宏表示11.0之后的版本才开始支持这个方法

/**
 *  不能被使用
 */
-(void)unavailable __attribute__((unavailable("已经不能被使用")));

/**
 *  不被使用也不会有警告
 */
-(void)unused __attribute__((unused));

/**
 *  没有使用该方法的返回值会出现警告
 */
-(NSInteger)warnUnusedResult __attribute__((warn_unused_result));

/**
 *  不能在 swift 中调用该方法
 */
-(void)unavailableInSwift __attribute__((availability(swift, unavailable, message="不能在 swift 中调用该方法")));

/**
 *  子类继承后，重写方法实现必须调用 super
 */
-(void)requiresSuper __attribute__((objc_requires_super));

@end



