//
//  ViewController.h
//  InvertedCamera
//
//  Created by Yi Hua on 11/3/16.
//  Copyright © 2016 Yi Hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <opencv2/opencv.hpp>

@interface ViewController : UIViewController<CvVideoCameraDelegate>
{
    CvVideoCamera *videoCamera; // OpenCV class for accessing the camera
}
// Declare internal property of videoCamera
@property (nonatomic, retain) CvVideoCamera *videoCamera;


@end

