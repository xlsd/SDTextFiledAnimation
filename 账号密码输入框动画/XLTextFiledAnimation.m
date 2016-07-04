//
//  XLTextFiledAnimation.m
//  账号密码输入框动画
//
//  Created by 薛林 on 16/7/4.
//  Copyright © 2016年 xuelin. All rights reserved.
//

#import "XLTextFiledAnimation.h"

@interface XLTextFiledAnimation (){
    //声明成员变量
    //嵌入
    CGFloat inset;
    //图层
    CAShapeLayer *leftLayer;
    //嵌入点
    CGPoint textFieldInset,placeholderInset;
}

//placeholder的高度
@property (nonatomic) CGFloat placeholderHeight;
@end

@implementation XLTextFiledAnimation
//@synthesize placeHolderLabel;

#pragma mark - 绘制动画
- (void)drawRect:(CGRect)rect {
    
    //添加placeHolderLabel
    [self addPlaceHolderLabel];
    
    //创建路径
    UIBezierPath *leftPath = [UIBezierPath bezierPath];
    
    //起点
    [leftPath moveToPoint:CGPointMake(0,self.bounds.size.height)];
    
    //画第一条线
    [leftPath addLineToPoint:CGPointMake(0,self.bounds.size.height)];
    
    //画第二条线
    [leftPath addLineToPoint:CGPointMake(self.bounds.size.width,self.bounds.size.height)];
    
    //设置图层的属性
    leftLayer.path = leftPath.CGPath; //动画路径
    leftLayer.strokeColor = [[UIColor whiteColor] CGColor];  //外边框颜色
    leftLayer.fillColor = nil;   //不设置路径颜色填充
    
    leftLayer.borderWidth = 3.0f; //图层边框
    leftLayer.lineCap = kCALineCapRound;    //线头样式为圆形
    leftLayer.lineJoin = kCALineJoinRound;  //拐角样式为圆角
    //    leftLayer.frame=CGRectMake(0, 50, 200, 1);
    leftLayer.borderColor=[UIColor blackColor].CGColor; //边框颜色
    
    //添加图层
    [self.layer addSublayer:leftLayer];
}

#pragma mark - 重写初始化方法
//使用文件加载的对象调用（如从xib或stroyboard中创建）
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    //设置代理
    self.delegate = self;
    //创建placeHolderLabel
    if (self) {
        self.placeHolderLabel = [[UILabel alloc] init];
        
        //设置placeHolder
        
        //设置字体颜色
        self.placeHolderLabel.textColor = [UIColor whiteColor];
        
        //设置；Label背景色
        self.placeHolderLabel.backgroundColor=[UIColor clearColor];
        
        //设置字体样式及大小
        self.placeHolderLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        
        //设置文字居中
        self.placeHolderLabel.textAlignment = NSTextAlignmentLeft;
        
        //设置嵌入点
        placeholderInset = CGPointMake(6, 6);
        textFieldInset = CGPointMake(6, 6);
        
        //初始化图层
        leftLayer = [CAShapeLayer layer];
        
        //设置背景色
        self.backgroundColor=[UIColor clearColor];
        
    }
    
    return self;
}
/**
 *  重写initWithFrame方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    //设置代理
    self.delegate = self;
    //创建placeHolderLabel
    if (self) {
        self.placeHolderLabel = [[UILabel alloc] init];
        
        //设置placeHolder
        
        //设置字体颜色
        self.placeHolderLabel.textColor = [UIColor whiteColor];
        
        //设置；Label背景色
        self.placeHolderLabel.backgroundColor=[UIColor clearColor];
        
        //设置字体样式及大小
        self.placeHolderLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        
        //设置文字居中
        self.placeHolderLabel.textAlignment = NSTextAlignmentLeft;
        
        //设置嵌入点
        placeholderInset = CGPointMake(6, 6);
        textFieldInset = CGPointMake(6, 6);
        
        //初始化图层
        leftLayer = [CAShapeLayer layer];
        
        //设置背景色
        self.backgroundColor=[UIColor clearColor];
        
    }

    return self;
}
#pragma mark - 动画曲线
/**
 *  设置动画曲线
 */
-(void)animateCureve{
    //创建基本动画
    CABasicAnimation *pathAppear = [CABasicAnimation animationWithKeyPath:@"path"];
    
    //动画时间
    pathAppear.duration = 1.5;
    
    //动画初始值
    pathAppear.fromValue = (__bridge id)leftLayer.path;
    
    //动画结束值
    pathAppear.toValue   = (__bridge id)[self wavePath].CGPath;
    
    //在图层上添加动画
    [leftLayer addAnimation:pathAppear forKey:@"make the path appear"];
    
}

/**
 *  波浪线的变化设置
 */
- (UIBezierPath *)wavePath {
    //创建路径
    UIBezierPath *startPath = [UIBezierPath bezierPath];
    //起点
    [startPath moveToPoint:CGPointMake(0, self.bounds.size.height)];
    
//    以三个点绘制一条曲线
    [startPath addCurveToPoint:CGPointMake(self.bounds.size.width-25, self.bounds.size.height) controlPoint1:CGPointMake(50, self.bounds.size.height+0)  controlPoint2:CGPointMake(self.bounds.size.width/2, 50) ];
    
    //起点
    [startPath moveToPoint:CGPointMake(self.bounds.size.width-25, self.bounds.size.height)];
    
    //划线
    [startPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];


    return startPath;
}

/**
 *  设置placeHolder的高度
 */
-(void)setPlaceholderHeight:(CGFloat)placeholderHeight{
    
    
}

/**
 *  返回placeHolder的高度
 */
-(CGFloat)placeholderHeight{
    //设置字体样式
    UIFont *fontOfText=[UIFont fontWithName:@"HelveticaNeue" size:self.font.pointSize*0.7];
    
    //返回高度
    return placeholderInset.y+fontOfText.lineHeight;
}

#pragma mark - 添加placeHolderLabel
- (void)addPlaceHolderLabel
{
    //label大小及位置
    self.placeHolderLabel.frame=CGRectMake(0, self.bounds.size.height-24, self.bounds.size.width, 24);
    
    //添加
    [self addSubview:self.placeHolderLabel];
    
}

//设置图层边界
-(void)setBorderLayer{
    
}

#pragma mark - 修改文字边距
-(CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectOffset(self.bounds, 0, self.bounds.size.height/2-textFieldInset.y);
}

-(CGRect)editingRectForBounds:(CGRect)bounds{
    return [self textRectForBounds:bounds];
}

#pragma mark - TextFiled代理方法
//开始编辑
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //调用动画 判断是否需要动画
    if (self.animationLine) {
        [self animateCureve];
    }
    
    //设置动画时长
    [UIView animateWithDuration:0.5 delay:0.2 options:0 animations:^{
        self.placeHolderLabel.frame=CGRectMake(0, 24, self.bounds.size.width, 24);
    } completion:^(BOOL finished) {
        
    }];
}

/**
 *  设置第一响应者
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self resignFirstResponder];
    return YES;
}

//编辑结束后执行
-(void)textFieldDidEndEditing:(UITextField *)textField{
    //判断文本内容
    if([textField.text isEqual:@""]){
        
        //执行动画
        [UIView animateWithDuration:0.5 animations:^{
            
            self.placeHolderLabel.frame=CGRectMake(0, self.bounds.size.height-24, self.bounds.size.width, 24);
            
        }];
    }
    
}

@end
