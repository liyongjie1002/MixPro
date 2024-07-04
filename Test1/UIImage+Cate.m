//
//  UIImage+Cate.m
//  Test1
//
//  Created by xdf on 2024/6/3.
//

#import "UIImage+Cate.h"

@implementation UIImage (Cate)
-(UIImage*) scaleToSize:(CGSize)size

{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
@end
