//
//  XLTextFiledAnimation.h
//  账号密码输入框动画
//
//  Created by 薛林 on 16/7/4.
//  Copyright © 2016年 xuelin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLTextFiledAnimation : UITextField<UITextFieldDelegate>
/**
 *  是否需要波浪线
 */
@property (nonatomic, assign) BOOL animationLine;

/**
 *  textFiled中的动画Label
 */
@property (strong ,nonatomic) UILabel *placeHolderLabel;

@end
