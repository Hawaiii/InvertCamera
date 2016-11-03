//
//  ViewController.m
//  InvertedCamera
//
//  Created by Yi Hua on 11/3/16.
//  Copyright © 2016 Yi Hua. All rights reserved.
//

#import "ViewController.h"
#ifdef __cplusplus
#include <opencv2/opencv.hpp>
#include <iostream>
#endif


@interface ViewController (){
    UIImageView *imageView_; // Setup the image view
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float cam_width = 720; float cam_height = 1280;
    
    // Take into account size of camera input
    int view_width = self.view.frame.size.width;
    int view_height = (int)(cam_height*self.view.frame.size.width/cam_width);
    int offset = (self.view.frame.size.height - view_height)/2;
    
    imageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, offset, view_width, view_height)];
    
    [self.view addSubview:imageView_]; // Add the view
    
    // Initialize the video camera
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:imageView_];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30; // Set the frame rate
    self.videoCamera.grayscaleMode = NO;
    self.videoCamera.rotateVideo = YES;
    
    // Choose these depending on the camera input chosen
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset1280x720;
    
    [videoCamera start];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) processImage:(cv:: Mat &)image
{
    // flip upside down and right side left
    cv::flip(image, image, -1);
}


@end
