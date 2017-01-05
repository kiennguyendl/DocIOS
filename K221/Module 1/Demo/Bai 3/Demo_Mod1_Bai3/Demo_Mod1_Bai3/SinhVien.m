//
//  SinhVien.m
//  Demo_Mod1_Bai3
//
//  Created by TNKHANH on 3/11/16.
//  Copyright © 2016 T3H. All rights reserved.
//

#import "SinhVien.h"

@implementation SinhVien
int studentId = 1;
-(id)initSV{
    
    self.ma = [NSString stringWithFormat:@"SV%04d",studentId];
    self.ten = [self layTenNgauNhien];
    self.tuoi = [self layTuoiNgauNhien];
    studentId++;
    
    return self;
}
-(void)hoc{
    NSLog(@"Sinh vien %@ -  %@ - %ld tuoi dang hoc",self.ma,self.ten,self.tuoi);
}
-(void)lamBaiTap{
     NSLog(@"Sinh vien %@ -  %@ - %ld tuoi dang lam bai tap",self.ma,self.ten,self.tuoi);
}
//Ham lay tuoi ngau nhien tu 18->60
-(NSInteger)layTuoiNgauNhien{
    return arc4random() % 43 + 18;
}
//Ham lay ten ngau nhien
-(NSString *)layTenNgauNhien{
    NSArray *dsTen = @[@"Chuc",@"Tu",@"Hung",@"Thu",@"Nam"];
    return dsTen[arc4random()%dsTen.count];
}
@end
