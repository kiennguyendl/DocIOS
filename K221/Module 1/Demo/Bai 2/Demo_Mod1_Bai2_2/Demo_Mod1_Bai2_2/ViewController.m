//
//  ViewController.m
//  Demo_Mod1_Bai2_2
//
//  Created by TNKHANH on 3/7/16.
//  Copyright © 2016 T3H. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Khai bao bien
    int a = 5;
    int b = 7;
    //goi ham Cong 2 so nguyen
    int c = [self cong2So:a vaSo2:b];
    NSLog(@"%d",c);
    
    int soNgay = [self tinhNgayTrongThang:2 vaNam:2017];
    NSLog(@"%d",soNgay);
    giaiPTBac2(2, -9, 4);
    
    //Bai tap 2_2
    [self BaiTap2_2];
}
//Ham cong 2 so nguyen
-(int)cong2So:(int)so1 vaSo2:(int)so2{
    int tong = so1 + so2;
    return tong;
}

//Ham tinh ngay trong thang
-(int)tinhNgayTrongThang:(int)thang vaNam:(int)nam{
    switch (thang) {
        case 1:case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
            break;
        case 4: case 6: case 9: case 11:
            return 30;
            break;
        case 2:{
            if (nam % 4 == 0) {//Nam nhuan
                return 29;
            }
            return 28;
            break;
        }
        default:
            break;
    }
    return 0;
}
//Ham giai Phuong trinh bac 2
void giaiPTBac2(float a, float b, float c){
    float x,x1,x2;
    if (a == 0 && b== 0 & c == 0) {
        NSLog(@"PT Vo so nghiem");
    }
    else if (a == 0 && b== 0) {
        NSLog(@"PT Vo nghiem");
    }
    else if(a == 0) {
        x = -c/b;
        NSLog(@"PT co nghiem don x= %.2f",x);
    }
    else{
        float delta = b*b-4*a*c;
        if (delta < 0) {
            NSLog(@"PT Vo nghiem");
        }
        else if(delta == 0){
            x = -b/(2*a);
            NSLog(@"PT co nghiem kep x= %.2f",x);
        }
        else{
            x1 = (-b-sqrt(delta))/(2*a);
            x2 = (-b+sqrt(delta))/(2*a);
            NSLog(@"PT co 2 nghiem phan biet x1 = %.2f, x2 = %.2f",x1,x2);
        }
    }
}

//Bai tap 2_2
-(void)BaiTap2_2{
    //Khoi tao mang de luu ten
    NSArray *dsTen = @[@"Mai",@"Tuyết",@"Ngọc",@"Tú",@"Minh",@"Tuấn",@"Hoa",@"Lộc"];
    //Khoi tao mang de luu ho
    NSArray *dsHo = [NSArray arrayWithObjects:@"Trần",@"Lê",@"Nguyễn",@"Võ",@"Đặng",@"Phan", nil];
    
    //Khoi tao mang luu tru ho ten day du
    NSMutableArray *dsHoTen = [[NSMutableArray alloc] init];
    
    //Ghep ho va ten ngau nhien
    for (int i = 0; i < 20; i++) {
        //Lay ra vi tri ngau nhien trong mang ho
        NSInteger vHo = arc4random() % dsHo.count;
        //Lay ra phan tu tuong ung voi vi tri ngau nhien trong mang ho
        NSString *ho = [dsHo objectAtIndex:vHo];
        //Lay ra vi tri ngau nhien trong mang ten
        NSInteger vTen = arc4random() % dsTen.count;
        //Lay ra phan tu tuong ung voi vi tri ngau nhien trong mang ho
        NSString *ten = dsTen[vTen];
        //Noi ho va ten
        NSString *hoTen = [NSString stringWithFormat:@"%@ %@",ho,ten];
        //Them ten day du vao ds ho ten
        [dsHoTen addObject:hoTen];
        NSLog(@"%@",hoTen);
    }
    
    //In mang dsHoTen nay ra man hinh
    for (NSString *item in dsHoTen) {
        NSLog(@"%@",item);
    }
    
    //Sap xep danh sach ho ten theo A->Z
    NSArray *dsHoTenSapXep = [dsHoTen sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSString *hoTen1 = [NSString stringWithFormat:@"%@",obj1];
        NSString *hoTen2 = [NSString stringWithFormat:@"%@",obj2];
        return [hoTen1 compare:hoTen2];
    }];
    
    NSLog(@"----------Danh sach ten da sap xep-----------");
    for (NSString *item in dsHoTenSapXep) {
        NSLog(@"%@",item);
    }
    
    //Tao ds 20 ho ten khong trung nhau
    NSMutableArray *dsHoTen2 = [[NSMutableArray alloc] init];
    int i=0;
    while (i<20) {
        //Lay ra vi tri ngau nhien trong mang ho
        NSInteger vHo = arc4random() % dsHo.count;
        //Lay ra phan tu tuong ung voi vi tri ngau nhien trong mang ho
        NSString *ho = [dsHo objectAtIndex:vHo];
        //Lay ra vi tri ngau nhien trong mang ten
        NSInteger vTen = arc4random() % dsTen.count;
        //Lay ra phan tu tuong ung voi vi tri ngau nhien trong mang ho
        NSString *ten = dsTen[vTen];
        //Noi ho va ten
        NSString *hoTen = [NSString stringWithFormat:@"%@ %@",ho,ten];
        if (![dsHoTen2 containsObject:hoTen]) {//Neu khong ton tai hoTen trong dsHoTen
            //Them ten day du vao ds ho ten
            [dsHoTen2 addObject:hoTen];
            i++;
        }
    }
    
    NSArray *dsHoTenSapXep2 = [dsHoTen2 sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSString *hoTen1 = [NSString stringWithFormat:@"%@",obj1];
        NSString *hoTen2 = [NSString stringWithFormat:@"%@",obj2];
        return [hoTen1 compare:hoTen2];
    }];
    
    NSLog(@"----------Danh sach ten khong trung da sap xep-----------");
    for (NSString *item in dsHoTenSapXep2) {
        NSLog(@"%@",item);
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
