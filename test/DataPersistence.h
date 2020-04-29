////
////  DataPersistence.h
////  test
////
////  Created by 谢政 on 2020/4/29.
////  Copyright © 2020 maimemo. All rights reserved.
////
//
#import <Foundation/Foundation.h>

NSString *docPath(void);

NS_ASSUME_NONNULL_BEGIN

@interface DataPersistence : NSObject {
//    DataPersistence *_instance_singleton;
//    NSMutableArray *_data;
}

+ (DataPersistence *) sharedInstance;
- (NSArray *)getData;
- (void)saveData;
- (void)addData: (NSString*)data;
- (void)removeData: (NSString*)data;

@end

NS_ASSUME_NONNULL_END
