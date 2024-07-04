//
//  ViewController.m
//  Test1
//
//  Created by xdf on 2024/4/16.
//

#import "ViewController.h"
#import "TimerViewController.h"
#import "KooTfPopTaskCenter.h"
#import "UIImage+Cate.h"

#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface ViewController ()

@property (nonatomic, strong) KooTfPopTaskCenter *taskCenter;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    HomePopTaskPopView1 *popView1 = [[HomePopTaskPopView1 alloc] init];
//    popView1.priority = KooTfPopTaskPriorityLow;
//    
//    HomePopTaskPopView2 *popView2 = [[HomePopTaskPopView2 alloc] init];
//    popView2.priority = KooTfPopTaskPriorityHigh;
//    
//    self.taskCenter = [KooTfPopTaskCenter new];
//    
//    [self.taskCenter addPopTask:popView1];
//    [self.taskCenter addPopTask:popView2];
    
    
    self.imageView = [[UIImageView alloc] init];
    [self.view addSubview:self.imageView];
    
}
//2.自定长宽
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

//    self.imageView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 128);
//
//    UIImage *image = [UIImage imageNamed:@"kooys_write_correct_top_ipad"];
//    image = [self reSizeImage:image toSize:CGSizeMake(768, 130.5)];
//    UIEdgeInsets insets = UIEdgeInsetsMake(0, 400, 0, 367);
//    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
//    self.imageView.image = image;
    
//    
        self.imageView.frame = CGRectMake(26, 100, [UIScreen mainScreen].bounds.size.width - 26*2, 68);
    
        UIImage *image = [UIImage imageNamed:@"kooys_write_result_status_bg_purple_ipad"];
        image = [self reSizeImage:image toSize:CGSizeMake(763, 76)];
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 350, 0, 412);
        image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        self.imageView.image = image;
            
//    self.imageView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 303);
//    
//    UIImage *image = [UIImage imageNamed:@"kooys_write_result_top_bg_ipad"];
//    image = [self reSizeImage:image toSize:CGSizeMake(768, 303)];
//    UIEdgeInsets insets = UIEdgeInsetsMake(0, 300, 0, 466);
//    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
//    self.imageView.image = image;
    
    
}

- (IBAction)didClickTimerVC {
    
    TimerViewController *vc = [[TimerViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didClickPopTasks {
    
    [self.taskCenter beginPopTask];
    
}

- (IBAction)didClickGoFlutter {
    
    // 创建Flutter引擎
    FlutterEngine *flutterEngine = [[FlutterEngine alloc] initWithName:@"my_engine"];
    [flutterEngine run];
    [GeneratedPluginRegistrant registerWithRegistry:flutterEngine]; // Only if you have Flutter plugins
    
    // 创建FlutterViewController
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    
    // 显示FlutterViewController
    [self.navigationController pushViewController:flutterViewController animated:YES];
}



@end
