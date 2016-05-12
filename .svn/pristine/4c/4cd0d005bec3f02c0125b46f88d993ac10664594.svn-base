//
//  LYLocationManager.m
//  LocationTest
//
//  Created by 李勇 on 16/5/8.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface LYLocationManager()<CLLocationManagerDelegate>

//定位器
@property (strong, nonatomic) CLLocationManager *locationManager;

//反编译器
@property (strong, nonatomic) CLGeocoder *geocoder;

//定位结束回调
@property (copy, nonatomic) LocationFinishBlock locationFinishBlock;

@end

@implementation LYLocationManager

/**
 *  @author liyong
 *
 *  单例类
 *
 *  @return
 */
+ (id)sharedLocationManager
{
    static LYLocationManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LYLocationManager alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [self configLocationManager];
    }
    
    return self;
}

/**
 *  @author liyong
 *
 *  配置定位器的基本信息
 */
- (void)configLocationManager
{
    if ([CLLocationManager locationServicesEnabled])
    {
        if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied)
        {
            //定位器
            self.locationManager = [[CLLocationManager alloc] init];
            if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
            {
                //开通权限
                [self.locationManager requestWhenInUseAuthorization];
            }
            
            //反编译器
            self.geocoder = [[CLGeocoder alloc] init];
        }else
        {
            NSLog(@"定位功能未打开");
        }
    }else
    {
        NSLog(@"定位功能未打开");
    }
}

/**
 *  @author liyong
 *
 *  开始定位
 *
 *  @param locationFinishBlock 定位结束回调
 */
- (void)startLocationWithFinishBlock:(LocationFinishBlock)locationFinishBlock
{
    self.locationFinishBlock = locationFinishBlock;
    
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}

/**
 *  @author liyong
 *
 *  停止定位
 */
- (void)stopLocation
{
    self.locationManager.delegate = nil;
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [self stopLocation];
    
    //反编译经纬度
    if ([locations count] > 0)
    {
        if ([self.geocoder isGeocoding])
        {
            [self.geocoder cancelGeocode];
        }
        
        CLLocation *location = [locations firstObject];
        [self.geocoder reverseGeocodeLocation:location
                            completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                                if ([placemarks count] > 0)
                                {
                                    CLPlacemark *placemark = [placemarks firstObject];
                                    
                                    //获取定位的经纬度
                                    CLLocation *currLocation = placemark.location;
                                    //地址信息字典
                                    NSDictionary *addrDict = [placemark addressDictionary];
                                    //获取定位的省份
                                    NSString *stateStr = [addrDict objectForKey:@"State"];
                                    //获取定位的城市
                                    NSString *city = [addrDict objectForKey:@"City"];
                                    //获取定位的subLocality
                                    NSString *subLocalityStr = [addrDict objectForKey:@"SubLocality"];
                                    //获取定位的街道
                                    NSString *streetStr = [addrDict objectForKey:@"Street"] == nil ? @"" : [addrDict objectForKey:@"Street"];
                                    //地名
                                    NSString *Name = [addrDict objectForKey:@"Name"];
                                    
                                    NSDictionary *locationDic;
                                    if ([[[addrDict objectForKey:@"FormattedAddressLines"] class] isSubclassOfClass:NSClassFromString(@"NSArray")])
                                    {
                                        NSArray *addrArr = [addrDict objectForKey:@"FormattedAddressLines"];
                                        NSString *address = [NSString stringWithFormat:@"%@%@%@%@",stateStr,city,subLocalityStr,streetStr];
                                        NSString *tempAddress = [addrArr count] > 0 ? [addrArr firstObject] : address;
                                        
                                        locationDic = @{@"name" : [Name length] > 0 ? Name : @"",
                                                        @"tempAddress" : [tempAddress length] > 0 ? tempAddress : @"",
                                                        @"stateStr" : [stateStr length] > 0 ? stateStr : @"",
                                                        @"city" : [[addrDict objectForKey:@"City"] length] > 0 ? [addrDict objectForKey:@"City"] : @"",
                                                        @"subLocalityStr" : [subLocalityStr length] > 0 ? subLocalityStr : @"",
                                                        @"streetStr" : [streetStr length] > 0 ? streetStr : @"",
                                                        @"currLocation" : currLocation};
                                    }else if ([[[addrDict objectForKey:@"FormattedAddressLines"] class] isSubclassOfClass:NSClassFromString(@"NSString")])
                                    {
                                        NSString *tempAddress = [addrDict objectForKey:@"FormattedAddressLines"];
                                        
                                        locationDic = @{@"name" : [Name length] > 0 ? Name : @"",
                                                        @"tempAddress" : [tempAddress length] > 0 ? tempAddress : @"",
                                                        @"stateStr" : [stateStr length] > 0 ? stateStr : @"",
                                                        @"city" : [[addrDict objectForKey:@"City"] length] > 0 ? [addrDict objectForKey:@"City"] : @"",
                                                        @"subLocalityStr" : [subLocalityStr length] > 0 ? subLocalityStr : @"",
                                                        @"streetStr" : [streetStr length] > 0 ? streetStr : @"",
                                                        @"currLocation" : currLocation};
                                    }
                                    
                                    self.locationFinishBlock(YES, locationDic);
                                }else
                                {
                                    if (self.locationFinishBlock != nil)
                                    {
                                        self.locationFinishBlock( NO, nil);
                                    }
                                }
                            }];
    }else
    {
        if (self.locationFinishBlock != nil)
        {
            self.locationFinishBlock( NO, nil);
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [self stopLocation];
    
    if (self.locationFinishBlock != nil)
    {
        self.locationFinishBlock( NO, nil);
    }
}

@end
