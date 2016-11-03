//
//  AppDelegate.h
//  InvertedCamera
//
//  Created by Yi Hua on 11/3/16.
//  Copyright © 2016 Yi Hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

