//
//  PhanSo.h
//  Demo_Mod1_Bai3
//
//  Created by TNKHANH on 3/11/16.
//  Copyright © 2016 T3H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhanSo : NSObject
//Khai bao thuoc tinh
@property (nonatomic,setter=abc:)int tuSo;
@property (nonatomic)int mauSo;
@property (nonatomic, strong)NSString *someProperty;
//Khai bao Phuong thuc
-(PhanSo *)congPS1:(PhanSo *)ps1 vaPS2:(PhanSo *)ps2;
//Phuong thuc khoi tao tu dinh nghia
-(instancetype)initWithTuso:(int)tu vaMau:(int)mau;
-(id)initWithTu:(int)tu vaMau:(int)mau;
-(void)setTuSo:(int)tu;
-(void)abc:(int)tu;

//Class Method
+(PhanSo *)congPS1:(PhanSo *)ps1 vaPS2:(PhanSo *)ps2;
@end
