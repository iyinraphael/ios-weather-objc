//
//  ViewController.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak) id <UICollectionViewDataSource> collectionViewDataSource;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

