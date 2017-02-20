//
//  MyImageViewController.m
//  CocoaPodsSample
//
//  Created by nishanth golla on 12/19/16.
//  Copyright © 2016 nishanth golla. All rights reserved.
//

#import "MyImageViewController.h"
#import <AFNetworking/AFNetworking.h>


@interface MyImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) NSURL *imageUrl;

@end

@implementation MyImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLSessionConfiguration *configaration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //Create AFNetworking Session manager instance.
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configaration];
    NSURL *url = [NSURL URLWithString:@"http://www.planwallpaper.com/static/images/background-gmail-google-images_FG2XwaO.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //Creating downloadTask
    
    NSURLSessionDownloadTask *imageDownload = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        self.imageUrl = [[[NSFileManager defaultManager]URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil]URLByAppendingPathComponent:@"myImage.jpg"];
        return self.imageUrl;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        self.myImage.image = [UIImage imageWithContentsOfFile:self.imageUrl.path];
        
    }];
    
    [imageDownload resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
