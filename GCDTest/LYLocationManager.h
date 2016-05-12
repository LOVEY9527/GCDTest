//
//  LYLocationManager.h
//  LocationTest
//
//  Created by 李勇 on 16/5/8.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationFinishBlock)(BOOL locationSuccess, NSDictionary *LocationDic);

@interface LYLocationManager : NSObject

/**
 *  @author liyong
 *
 *  单例类
 *
 *  @return
 */
+ (id)sharedLocationManager;

/**
 *  @author liyong
 *
 *  开始定位
 *
 *  @param locationFinishBlock 定位结束回调
 */
- (void)startLocationWithFinishBlock:(LocationFinishBlock)locationFinishBlock;

/**
 *  @author liyong
 *
 *  停止定位
 */
- (void)stopLocation;

@end
