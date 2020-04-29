//
//  ViewController.h
//  test
//
//  Created by 谢政 on 2020/4/29.
//  Copyright © 2020 maimemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPersistence.h"

NSString *docPath(void);

@interface ViewController : UIViewController
<UIApplicationDelegate, UITableViewDataSource> {
//    DataPersistence *_dataPersistence;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;
@property (nonatomic) DataPersistence *tasks_data;

- (void)addTask: (id)sender;

@end

