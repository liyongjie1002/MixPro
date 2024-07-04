//
//  TimerViewController.m
//  Test1
//
//  Created by xdf on 2024/4/25.
//

#import "TimerViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface TimerViewController ()

@property (nonatomic, strong) RACDisposable *btnDispose;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 进入后台
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil] subscribeNext:^(NSNotification *notification) {
        @strongify(self);
        NSLog(@"111");
    }];
    
    // 进入前台
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationWillEnterForegroundNotification object:nil] subscribeNext:^(NSNotification *notification) {
        @strongify(self);
        NSLog(@"222");
    }];
    
    // 销毁
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationWillTerminateNotification object:nil] subscribeNext:^(NSNotification *notification) {
        @strongify(self);
        NSLog(@"333");
        [self clearTimer];
    }];
}


- (IBAction)createTimer {
    
    __block int time = 20;

    //subscribeNext返回一个RACDisposable，可以用来取消订阅
    self.btnDispose =  [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        
        time--;
        NSLog(@"倒计时%d", time);
        if(time == 0) {
            [self.btnDispose dispose];
            NSLog(@"倒计时结束，停止录音，上传");
        }
    }];

}

- (IBAction)destoryTimer {
    [self.btnDispose dispose];
    NSLog(@"主动停止录音，上传");
}

- (void)clearTimer {
    [self.btnDispose dispose];
    NSLog(@"被动停止录音，不上传");
}

- (void)dealloc
{
    NSLog(@"123123");
}


@end
