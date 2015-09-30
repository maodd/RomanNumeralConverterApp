//
//  ViewController.m
//  devfacto-test
//
//  Created by Frank Mao on 2015-09-30.
//  Copyright © 2015 mazoic. All rights reserved.
//

#import "ViewController.h"
#import "NSNumber+RomanNumeral.h"

@interface ViewController ()
- (IBAction)sliderChanged:(id)sender;

- (IBAction)doConvert:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.outputLabel.text = @"";
    self.outputLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderChanged:(id)sender {
    self.inputTextField.text =   [NSString stringWithFormat:@"%d", (int)self.slider.value];
}

- (IBAction)doConvert:(id)sender {

    [self convertToRomanNumeral:self.inputTextField.text];
    
}

- (void)convertToRomanNumeral:(NSString *)stringToConvert
{
    self.slider.value = [stringToConvert integerValue];
    
    
    NSNumber * inputNumber = [NSNumber numberWithInteger:stringToConvert.integerValue ];
    self.outputLabel.alpha = 0;
    [UIView  animateWithDuration:1
                      animations:^{
                          
                          self.outputLabel.text = [inputNumber romanNumeral];
                          
                          
                          self.outputLabel.alpha = 1;
                          
                          if ([self.outputLabel.text hasPrefix:@"error"]) {
                              self.outputLabel.textColor = [UIColor redColor];
                          }else{
                              self.outputLabel.textColor = [UIColor blueColor];
                          }
                          
                      }];
}

#pragma makr - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString * newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self convertToRomanNumeral:newText];
    return YES;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self doConvert:textField];
    return YES;
}
@end
