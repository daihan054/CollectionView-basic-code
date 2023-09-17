//
//  AppDelegate.h
//  ButtonDemoApp
//
//  Created by REVE Systems on 14/9/23.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

