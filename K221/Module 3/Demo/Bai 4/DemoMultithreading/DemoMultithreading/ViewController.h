//
//  ViewController.h
//  DemoMultithreading
//
//  Created by TNKHANH on 6/3/16.
//  Copyright © 2016 T3h. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblSliderValue;
- (IBAction)sliderDidChange:(UISlider *)sender;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViewArray;
- (IBAction)didStopClick:(id)sender;

- (IBAction)didStartClick:(id)sender;
//Khai bao bien chua danh sach cac url hinh anh
@property (nonatomic, strong)NSArray *imageUrlList;
@property (nonatomic,strong)NSOperationQueue *queue;
@end

