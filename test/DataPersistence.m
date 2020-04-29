////
////  DataPersistence.m
////  test
////
////  Created by 谢政 on 2020/4/29.
////  Copyright © 2020 maimemo. All rights reserved.
////
//
#import "DataPersistence.h"

NSString *docPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                            NSUserDomainMask,
                                                            YES);

    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}


static DataPersistence *_instance_singleton = nil;

@interface DataPersistence () {
    NSMutableArray *_data_array;
}
@end

NSMutableArray *_data_array;

@implementation DataPersistence

- (instancetype) init{
    [NSException raise: @"DataPersistence"
                format: @"Use sharedInstance:, not init"];
    return nil;
}

- (id) initOnce {
    self = [super init];
    if (self) {
        NSArray *plist = [NSArray arrayWithContentsOfFile: docPath()];
        _data_array = [plist mutableCopy];
        if (_data_array == nil) {
            _data_array = [NSMutableArray array];
        }
        return self;
    }
    return nil;
}

+ (DataPersistence *) sharedInstance{
    static DataPersistence *sharedInstance = nil;
    if (!sharedInstance) {
        sharedInstance = [[DataPersistence alloc] initOnce];
    }
    return sharedInstance;
}

- (NSArray *) getData{
    return [_data_array copy];
}

- (void) saveData{
    [_data_array writeToFile:docPath() atomically:YES];
}

- (void) addData: (NSString *)data{
    [_data_array addObject: data];
}

- (void) removeData: (NSString *)data{
    [_data_array removeObject: data];
}
@end
