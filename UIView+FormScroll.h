//
//  UIView+FormScroll.m
//
// Originally posted by Dan Ray http://stackoverflow.com/questions/5220818/moving-uiview-up-when-keyboard-shown/5221243#5221243
// Additions by Mark Rickert
//
// License: Public Domain

#import <Foundation/Foundation.h>

@interface UIView (FormScroll) 

-(void)scrollToY:(float)y;
-(void)scrollToView:(UIView *)view;
-(void)scrollElement:(UIView *)view toPoint:(float)y;

@end