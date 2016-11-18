//
//  DetailsOfStories.m
//  Ropsp
//
//  Created by Aethon Technologies on 18/11/16.
//  Copyright © 2016 Aethon Technologies. All rights reserved.
//

#import "DetailsOfStories.h"
#import "ViewController.h"
#import "DetailOfUser.h"
@interface DetailsOfStories ()
{
    DetailOfUser *controller;
    NSMutableArray *descriptionList;
BOOL buttonToggled;
    int number,number1,flag;
    NSNumber *num1;
    NSString *someString,*flagString;
}
@end

@implementation DetailsOfStories
@synthesize descriptionList;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 //  NSLog(@"%@",descriptionList);
    NSString *likeFlag=[descriptionList valueForKey:@"like_flag"];
     flag=[likeFlag intValue];
    NSLog(@"%d",flag);
    if(!flag){
        [_likeButton setTitle:@"like" forState:UIControlStateNormal];
    
    }else{
        [_likeButton setTitle:@"Unlike" forState:UIControlStateNormal];
        
    }
   
    UITextView *description=(UITextView *)[self.view viewWithTag:1];
    description.text=[NSString stringWithFormat:@"%@", [descriptionList valueForKey:@"description"]];
    description.editable=NO;
   
    UILabel *descriptionDate=(UILabel *)[self.view viewWithTag:2];
    descriptionDate.text=[NSString stringWithFormat:@"%@", [descriptionList valueForKey:@"verb"]];
    UIImageView *userImage=(UIImageView *)[self.view viewWithTag:5];
    NSData *imageData= [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[descriptionList valueForKey:@"si"]]];
  //  NSLog(@"%@",imageData);
    userImage.image=[UIImage imageWithData:imageData];
    NSString *likenum=[descriptionList valueForKey:@"likes_count"];
    num1 = @([likenum intValue]);
     number = [num1 intValue];
    number1=number;
  // NSLog(@"%d",number);
    UILabel *like_count=(UILabel *)[self.view viewWithTag:3];
   NSNumber *someNumber = @(number);
  someString = [someNumber stringValue];
    like_count.text=someString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)like:(id)sender {
    
    if (!flag) {
       
        [sender setTitle:@"Unlike" forState:UIControlStateNormal];
        //number is interger and num1 is NSNumber
        number1 = number1+1;
        UILabel *like_count=(UILabel *)[self.view viewWithTag:3];
        NSNumber *someNumber = @(number1);
        someString = [someNumber stringValue];
        like_count.text=someString;
        flag=true;
        NSNumber *flagNumber=@(flag);
        flagString=[flagNumber stringValue];
        
        
       //buttonToggled = YES;
     }
    else {
        [sender setTitle:@"Like" forState:UIControlStateNormal];
        number1 = number1-1;
        UILabel *like_count=(UILabel *)[self.view viewWithTag:3];
        NSNumber *someNumber = @(number1);
        someString = [someNumber stringValue];
        like_count.text=someString;
       // buttonToggled = NO;
        flag=false;
        NSNumber *flagNumber=@(flag);
        flagString=[flagNumber stringValue];
    }
    controller.isClick=YES;
    NSLog(@"%@ %@",someString,flagString);

    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationForData" object:someString];
    
 
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationForData1" object:flagString];
}
@end
