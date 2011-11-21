//
//  UIView+FormScroll.m
//
// Originally posted by Dan Ray http://stackoverflow.com/questions/5220818/moving-uiview-up-when-keyboard-shown/5221243#5221243
// Additions by Mark Rickert
//
// License: Public Domain

#import "UIView+FormScroll.h"

@implementation UIView (FormScroll)

-(void)scrollToY:(float)y
{		
	[UIView beginAnimations:@"registerScroll" context:NULL];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:kFormScrollAnimationTiming];
	self.transform = CGAffineTransformMakeTranslation(0, y);
	[UIView commitAnimations];	

	[self performSelector:@selector(notifyAnimationComplete) withObject:nil afterDelay:kFormScrollAnimationTiming];
}

-(void) notifyAnimationComplete
{
  [[NSNotificationCenter defaultCenter] postNotificationName:kFormScrollDidComplete object:nil];	
}
	 
-(void)scrollToView:(UIView *)view
{
	CGRect theFrame = view.frame;
	float y = theFrame.origin.y - 15;
	y -= (y/1.7);
	
	if(view.inputAccessoryView != nil)
	{
		UIView *inputAccessory = view.inputAccessoryView;
		CGRect inputAccessoryFrame = inputAccessory.frame;
		y += inputAccessoryFrame.size.height;
	}
	
	[self scrollToY:-y];
}


-(void)scrollElement:(UIView *)view toPoint:(float)y
{
	CGRect theFrame = view.frame;
	float orig_y = theFrame.origin.y;
	float diff = y - orig_y;
	if (diff < 0)
	{
		[self scrollToY:diff];
	}
	else
	{
		[self scrollToY:0];
	}
}

@end