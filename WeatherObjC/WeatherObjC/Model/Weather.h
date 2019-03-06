//
//  Weather.h
//  WeatherObjC
//
//  Created by Iyin Raphael on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSObject

- (instancetype) initWith: (NSString *)name temp: (double)temp image: (UIImage *)image NS_DESIGNATED_INITIALIZER;

- (instancetype) initWithDictionary: (NSDictionary *)dictionary  name:(NSString *)name ;

@property NSString *name;
@property double temp;
@property UIImage *image;


@end

NS_ASSUME_NONNULL_END
