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
    NSMutableArray *descriptionList;
BOOL buttonToggled;
    int number,number1;
    NSNumber *num1;
}
@end

@implementation DetailsOfStories
@synthesize descriptionList;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",descriptionList);
    
    UITextView *description=(UITextView *)[self.view viewWithTag:1];
    description.text=[NSString stringWithFormat:@"%@", [descriptionList valueForKey:@"description"]];
    description.editable=NO;
    _likeButton.titleLabel.text=@"like";
   UILabel *descriptionDate=(UILabel *)[self.view viewWithTag:2];
    descriptionDate.text=[NSString stringWithFormat:@"%@", [descriptionList valueForKey:@"verb"]];
    UIImageView *userImage=(UIImageView *)[self.view viewWithTag:5];
    NSData *imageData= [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[descriptionList valueForKey:@"si"]]];
    NSLog(@"%@",imageData);
    userImage.image=[UIImage imageWithData:imageData];
    NSString *likenum=[descriptionList valueForKey:@"likes_count"];
    num1 = @([likenum intValue]);
     number = [num1 intValue];
  // NSLog(@"%d",number);
    UILabel *like_count=(UILabel *)[self.view viewWithTag:3];
    NSNumber *someNumber = @(number);
    NSString *someString = [someNumber stringValue];
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
    
    if (!buttonToggled) {
        [sender setTitle:@"Unlike" forState:UIControlStateNormal];
        //number is interger
        number = [num1 intValue]+1;
        number1=number;
        UILabel *like_count=(UILabel *)[self.view viewWithTag:3];
        NSNumber *someNumber = @(number);
        NSString *someString = [someNumber stringValue];
        like_count.text=someString;
        buttonToggled = YES;
    }
    else {
        [sender setTitle:@"Like" forState:UIControlStateNormal];
        number1 = number1-1;
        UILabel *like_count=(UILabel *)[self.view viewWithTag:3];
        NSNumber *someNumber = @(number1);
        NSString *someString = [someNumber stringValue];
        like_count.text=someString;
        buttonToggled = NO;
    }
}
@end
