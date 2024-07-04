//
//  HomePopTask.m
//  Test1
//
//  Created by xdf on 2024/4/26.
//

#import "KooTfPopTaskCenter.h"

@implementation HomePopTaskPopView1

- (void)show:(KooTfPopTaskCompletedBlock)block {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"弹窗1完毕");
        block();
    });

}

@synthesize priority;

@end


@implementation HomePopTaskPopView2

- (void)show:(KooTfPopTaskCompletedBlock)block {
    
    NSLog(@"弹窗2完毕");
    block();

}

@synthesize priority;

@end

@implementation KooTfPopTaskCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tasks = (NSMutableArray<KooTfPopTaskProtocol> *)[NSMutableArray array];
    }
    return self;
}

- (void)addPopTask:(id<KooTfPopTaskProtocol>)task {
    
    if (task.priority == KooTfPopTaskPriorityNone) {
        return;
    }
    
    [self.tasks addObject:task];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"priority" ascending:NO];
    [self.tasks sortUsingDescriptors:@[sortDescriptor]];
    
//    NSLog(@"按优先级高排序%@", self.tasks);
}

- (void)beginPopTask {

    if (self.tasks.count == 0) {
        return;
    }
    
    id<KooTfPopTaskProtocol> obj = self.tasks.firstObject;
    __weak __typeof(self)weakSelf = self;
    [obj show:^{
        [weakSelf.tasks removeObjectAtIndex:0];
        [weakSelf beginPopTask];
    }];
}


@end
