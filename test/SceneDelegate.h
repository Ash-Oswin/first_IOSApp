//
//  SceneDelegate.h
//  test
//
//  Created by 谢政 on 2020/4/29.
//  Copyright © 2020 maimemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPersistence.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate> {
    DataPersistence *data;
}

@property (strong, nonatomic) UIWindow *window;

@end

