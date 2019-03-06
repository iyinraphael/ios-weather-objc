//
//  Weather.m
//  WeatherObjC
//
//  Created by Iyin Raphael on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "Weather.h"


@implementation Weather

- (instancetype) initWith:(NSString *)name temp:(double)temp image:(UIImage *)image {
    self = [super init];
    if (self) {
        _name = name;
        _temp = temp;
        _image = image;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    NSString *cityName = dictionary[name][@"name"];
    double temp = [dictionary[@"temp"][@"day"] doubleValue];
    NSArray *imageArray = dictionary[@"weather"];
    NSDictionary *imageDict = [[NSDictionary alloc] initWithObjectsAndKeys:imageArray[0], nil];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageDict[@"icon"]];
    
    return [self initWith:cityName temp:temp image:image];
    
}

@end

