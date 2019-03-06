//
//  WeatherController.m
//  WeatherObjC
//
//  Created by Iyin Raphael on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "WeatherController.h"
#import "Weather.h"

static NSString *baseURLString = @"http://api.openweathermap.org/data/2.5/forecast/daily";
static NSString *APIKey = @"4ab8981371fde679fb6ce66dabd9f486";

@interface WeatherController()


@end

@implementation WeatherController

- (void)fetchWeatherDataZip:(NSString *)zipCode completionBlock:(ControllerCompletionBlock)completionBlock
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    NSMutableArray *queryItem = [@[[NSURLQueryItem queryItemWithName:@"zip" value:zipCode],
                                 [NSURLQueryItem queryItemWithName:@"api" value:APIKey]] mutableCopy];
    urlComponents.queryItems = queryItem;
    NSURL *url = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Erro fetching data: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!dictionary) {
            NSLog(@"Error decoding json: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSString *nameCity = dictionary[@"city"];
        NSArray *weatherDictionary = dictionary[@"list"];
        NSMutableArray *weathers = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in weatherDictionary) {
            Weather *weather = [[Weather alloc] initWithDictionary:dict name:nameCity];
            [weathers addObject:weather];
        }
        self.weathers = weathers;
        
    }]resume];
}


@end
