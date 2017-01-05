//
//  PhanSo.m
//  Demo_Mod1_Bai3
//
//  Created by TNKHANH on 3/11/16.
//  Copyright © 2016 T3H. All rights reserved.
//

#import "PhanSo.h"

@implementation PhanSo
@synthesize someProperty;
@synthesize tuSo = _tuSo;
-(instancetype)initWithTuso:(int)tu vaMau:(int)mau{
    self.tuSo = tu;
    self.mauSo = mau;
    someProperty = @"abc";
    return self;
}
-(id)initWithTu:(int)tu vaMau:(int)mau{
    self.tuSo = tu;
    self.mauSo = mau;
    return self;
}
-(void)abc:(int)tu{
    _tuSo = tu + 2;
}

-(void)setTuSo:(int)tu{
    _tuSo = tu + 1;
}
-(PhanSo *)congPS1:(PhanSo *)ps1 vaPS2:(PhanSo *)ps2{
    //Khoi tao Phan so ket qua
    PhanSo *psKQ = [[PhanSo alloc] init];
    //Thuc hien phep tinh giua 2 phan so
    psKQ.tuSo = ps1.tuSo*ps2.mauSo + ps1.mauSo*ps2.tuSo;
    psKQ.mauSo = ps1.mauSo*ps2.mauSo;

    return psKQ;
}
+(PhanSo *)congPS1:(PhanSo *)ps1 vaPS2:(PhanSo *)ps2{
    //Khoi tao Phan so ket qua
    PhanSo *psKQ = [[PhanSo alloc] init];
    //Thuc hien phep tinh giua 2 phan so
    psKQ.tuSo = ps1.tuSo*ps2.mauSo + ps1.mauSo*ps2.tuSo;
    psKQ.mauSo = ps1.mauSo*ps2.mauSo;
    
    return psKQ;

}
@end
