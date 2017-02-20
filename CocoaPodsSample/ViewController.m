//
//  ViewController.m
//  CocoaPodsSample
//
//  Created by nishanth golla on 12/19/16.
//  Copyright © 2016 nishanth golla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)loginClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginClicked:(id)sender {
    
    if( [self.username.text isEqualToString:@"test1"] && [self.passwordField.text isEqualToString:@"test1"])
    {
        [self performSegueWithIdentifier:@"home" sender:nil];
        
    }
    else{
        UIAlertController *loginFaildAlert = [UIAlertController alertControllerWithTitle:@"LoginFailed" message:@"InvalidCredentials" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.username.text = nil;
            self.passwordField.text = nil;
            [self.username becomeFirstResponder];
        }];
        
        [loginFaildAlert addAction:okAction];
        
        [self presentViewController:loginFaildAlert animated:YES completion:nil];
    }
}
@end
