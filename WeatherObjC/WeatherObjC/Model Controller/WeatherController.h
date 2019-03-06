//
//  WeatherController.h
//  WeatherObjC
//
//  Created by Iyin Raphael on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ ControllerCompletionBlock)(NSArray *, NSError *);

NS_ASSUME_NONNULL_BEGIN

@interface WeatherController : NSObject

- (void) fetchWeatherDataZip: (NSString *)zipCode completionBlock: (ControllerCompletionBlock)completionBlock;
@property NSArray *weathers;

@end

NS_ASSUME_NONNULL_END
