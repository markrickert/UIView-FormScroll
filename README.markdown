#How to use

1. Add the `.h` and `.m` files to your project.
2. Import the `.h` file using: `#import "UIView+FormScroll.h"`
3. Example usage for moving a view up and down when a text field becomes active and resigns the first responder:

```Objective-C
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.view scrollToView:textField];
}
-(void) textFieldDidEndEditing:(UITextField *)textField
{
    [self.view scrollToY:0];
    [textField resignFirstResponder];
}
```
#Credits

Originally posted to [StackOverflow.com](http://stackoverflow.com/questions/5220818/moving-uiview-up-when-keyboard-shown/5221243#5221243) by [Dan Ray](http://www.danray.net).

Improvements by [Mark Rickert](http://www.mohawkapps.com) 

#License

Public Domain