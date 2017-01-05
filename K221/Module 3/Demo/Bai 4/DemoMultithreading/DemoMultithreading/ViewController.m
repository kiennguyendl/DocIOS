//
//  ViewController.m
//  DemoMultithreading
//
//  Created by TNKHANH on 6/3/16.
//  Copyright © 2016 T3h. All rights reserved.
//

#import "ViewController.h"
#define kImageUrl4 @"http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg"
#define kImageUrl2 @"http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg"
#define kImageUrl3 @"http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg"
#define kImageUrl1 @"http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"

@interface ViewController ()

@end

@implementation ViewController
@synthesize queue;
- (void)viewDidLoad {
    [super viewDidLoad];
    //Khoi tao mang chua url hinh anh
    self.imageUrlList = @[kImageUrl1,kImageUrl2,kImageUrl3,kImageUrl4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderDidChange:(UISlider *)sender {
    self.lblSliderValue.text = [NSString stringWithFormat:@"%.0f",sender.value*100];
}
- (IBAction)didStopClick:(id)sender {
    //Huy cac operation chua duoc thuc hien trong hang doi
    [queue cancelAllOperations];
}

- (IBAction)didStartClick:(id)sender {
    //Tai hinh anh su dung GCD
    //[self loadImageWithGCDConcurrent:true];
    //Tai hinh anh su dung Operation Queue
    [self loadImageWithOperationQueueAndBlock:true];
    
}
//Tai hinh voi url
-(UIImage *)loadImageWithUrlString:(NSString *)urlString{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    return [UIImage imageWithData:imageData];
}
//Multithreading su dung GCD - Ham tu DN
-(void)loadImageWithGCDConcurrent:(BOOL)concurrent{
    //Tao hang doi
    dispatch_queue_t gcdQueue;
    if (concurrent == true) {
        //Tao hang doi concurrent
        gcdQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    else{
        //Tao hang doi serial
        gcdQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    }
    //Them cac cong bat dong bo vao hang doi
    for (int i =0; i<self.imageUrlList.count; i++) {
        dispatch_async(gcdQueue, ^{
            UIImageView *imageView = self.imageViewArray[i];
            UIImage *image = [self loadImageWithUrlString:self.imageUrlList[i]];
            //Cap nhat UI trong main Queue
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = image;
                imageView.alpha = 1.0f;
            });
        });
    }
}

//Multi-threading su dung Operation Queue
-(void)loadImageWithOperationQueueAndBlock:(BOOL)operationBlock{
    //Tao Hang doi operation queue
    queue = [[NSOperationQueue alloc] init];
    if (!operationBlock) {
        for (int i = 0; i < self.imageUrlList.count; i++) {
            [queue addOperationWithBlock:^{
                UIImage *image = [self loadImageWithUrlString:self.imageUrlList[i]];
                //Update UI tren main thread
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    UIImageView *imageView = self.imageViewArray[i];
                    imageView.image = image;
                    imageView.alpha = 1.0f;
                }];
            }];
        }
    }
    else{
        //Tao operation Block-0
        NSBlockOperation *operation0 = [NSBlockOperation blockOperationWithBlock:^{
            UIImage *image  = [self loadImageWithUrlString:self.imageUrlList[0]];
            //Update UI tren main thread
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UIImageView *imageView = self.imageViewArray[0];
                imageView.image = image;
                imageView.alpha = 1.0f;
            }];
        }];
        //Them Operation vao hang doi
        [queue addOperation:operation0];
        
        
        //Tao operation Block-1
        NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
            UIImage *image  = [self loadImageWithUrlString:self.imageUrlList[1]];
            //Update UI tren main thread
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UIImageView *imageView = self.imageViewArray[1];
                imageView.image = image;
                imageView.alpha = 1.0f;
            }];
        }];
        //Them Operation vao hang doi
        [queue addOperation:operation1];
        
        
        //Tao operation Block-2
        NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
            UIImage *image  = [self loadImageWithUrlString:self.imageUrlList[2]];
            //Update UI tren main thread
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UIImageView *imageView = self.imageViewArray[2];
                imageView.image = image;
                imageView.alpha = 1.0f;
            }];
        }];
        //Them Operation vao hang doi
        [queue addOperation:operation2];

        
        //Tao operation Block-3
        NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
            UIImage *image  = [self loadImageWithUrlString:self.imageUrlList[3]];
            //Update UI tren main thread
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UIImageView *imageView = self.imageViewArray[3];
                imageView.image = image;
                imageView.alpha = 1.0f;
            }];
        }];
        
        //Them dependency cho operation
        [operation3 addDependency:operation0];
        
        //Them Operation vao hang doi
        [queue addOperation:operation3];
        
        
        
    }
}
@end
