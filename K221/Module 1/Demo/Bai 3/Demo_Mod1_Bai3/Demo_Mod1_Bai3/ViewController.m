//
//  ViewController.m
//  Demo_Mod1_Bai3
//
//  Created by TNKHANH on 3/11/16.
//  Copyright © 2016 T3H. All rights reserved.
//

#import "ViewController.h"
#import "PhanSo.h"
#import "SinhVien.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Khoi tao va set gia tri cho ps1
    PhanSo *ps1 = [[PhanSo alloc] init];
    [ps1 setTuSo:1];
    ps1.mauSo = 2;
    
    //Khoi tao va set gia tri cho ps2
//    PhanSo *ps2 = [PhanSo new];
//    ps2.tuSo = 2;
//    ps2.mauSo = 3;
    
    //Khoi tao phan so bang phuong thuc khoi tao tu dinh nghia
    PhanSo *ps2 = [[PhanSo alloc] initWithTu:2 vaMau:3];
    
    
    //Thuc hien cong 2 phan so bang instance method
    PhanSo *psTong = [[PhanSo alloc] congPS1:ps1 vaPS2:ps2];
    //PhanSo *psTong = [PhanSo congPS1:ps1 vaPS2:ps2];
    
    //In ket qua ra Output
    NSLog(@"Tong 2 phan so: %d/%d",psTong.tuSo,psTong.mauSo);
    
    
    //////////Bai tap 3///////////////
    for (int i = 0; i < 10000; i++) {
        //Khoi tao sinh vien voi phuong thuc khoi tao tu dinh nghia
        SinhVien *sv = [[SinhVien alloc] initSV];
        //Goi phuong thuc cua lop SinhVien
        [sv hoc];
        [sv lamBaiTap];
        
        NSLog(@"------------");
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
