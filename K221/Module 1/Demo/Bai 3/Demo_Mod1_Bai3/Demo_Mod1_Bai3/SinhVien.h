//
//  SinhVien.h
//  Demo_Mod1_Bai3
//
//  Created by TNKHANH on 3/11/16.
//  Copyright © 2016 T3H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinhVien : NSObject
//Khai bao thuoc tinh
@property (nonatomic, strong)NSString *ma;
@property (nonatomic, strong)NSString *ten;
@property (nonatomic)NSInteger tuoi;
@property (nonatomic)NSInteger diem;

//Khai bao phuong thuc
-(id)initSV;
-(void)hoc;
-(void)lamBaiTap;
@end
