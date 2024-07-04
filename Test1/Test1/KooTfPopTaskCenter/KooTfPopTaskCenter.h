//
//  HomePopTask.h
//  Test1
//
//  Created by xdf on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum: NSInteger {
    KooTfPopTaskPriorityHigh = 1000,
    KooTfPopTaskPriorityMedium = 500,
    KooTfPopTaskPriorityLow = 100,
    KooTfPopTaskPriorityNone = 0, //无效
} KooTfPopTaskPriority;

typedef void(^KooTfPopTaskCompletedBlock)(void);

@protocol KooTfPopTaskProtocol <NSObject>

@optional;
- (void)show:(KooTfPopTaskCompletedBlock)block;

@property (nonatomic, assign) KooTfPopTaskPriority priority;

@end

@interface HomePopTaskPopView1 : UIView <KooTfPopTaskProtocol>

@end

@interface HomePopTaskPopView2 : UIView <KooTfPopTaskProtocol>

@end


@interface KooTfPopTaskCenter : NSObject

@property (nonatomic, strong) NSMutableArray <KooTfPopTaskProtocol> *tasks;

- (void)addPopTask:(id<KooTfPopTaskProtocol>)task;

- (void)beginPopTask;

@end


NS_ASSUME_NONNULL_END
