//
//  ViewController.m
//  Ropsp
//
//  Created by Aethon Technologies on 16/11/16.
//  Copyright © 2016 Aethon Technologies. All rights reserved.
//

#import "ViewController.h"
#import "DetailOfUser.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *userNameArray,*userAbout,*userImageArray,*userAboutdata;
    DetailOfUser *viewController;

}
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // init table view
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self jsonDataParsing];
    //viewController.arrayAboutList=[userAboutdata[1] mutableCopy];
    
}
-(void)jsonDataParsing{
    NSString* path  = [[NSBundle mainBundle] pathForResource:@"iOS_Android Data" ofType:@"json"];
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id allKeys = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    userAboutdata=[[NSMutableArray alloc]init];
    userNameArray=[[NSMutableArray alloc]init];
    userAbout=[[NSMutableArray alloc]init];
    userImageArray=[[NSMutableArray alloc]init];
    for (int i=2; i<[allKeys count]; i++) {
        [userAboutdata addObject:allKeys[i]];
    }
   

    for (int i=0; i<[allKeys count]; i++) {
        NSDictionary *arrayResult = [allKeys objectAtIndex:i];
        if([arrayResult objectForKey:@"username"]!=NULL){
            NSString *userName=[arrayResult objectForKey:@"username"];
            [userNameArray addObject:userName];
            
        }
        if([arrayResult objectForKey:@"about"]!=NULL){
            NSString *aboutUser=[arrayResult objectForKey:@"about"];
            [userAbout addObject:aboutUser];
            
        }
        if([arrayResult objectForKey:@"image"]!=NULL){
            NSString *userImage=[arrayResult objectForKey:@"image"];
            [userImageArray addObject:userImage];
            UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:
                                                      [NSURL URLWithString:[userImageArray objectAtIndex:i]]]];
            
            //After converted, replace the same array with the new UIImage Object
            [userImageArray replaceObjectAtIndex:i withObject: image];
            
        }
        
    }
    
  
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
   
            
    return userNameArray.count;
   
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    // Similar to UITableViewCell, but
    UITableViewCell *cell = (UITableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *userName=[(UILabel *)cell viewWithTag:1];
    userName.text=[userNameArray objectAtIndex:indexPath.row];
    UITextView *aboutUser=[(UITextView *)cell viewWithTag:2];
    aboutUser.text=[userAbout objectAtIndex:indexPath.row];
    aboutUser.editable=NO;
    UIImageView *userImage=[(UIImageView *)cell viewWithTag:3];
    userImage.image = (UIImage*) [userImageArray objectAtIndex:indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailOfUser"];
viewController.arrayAboutList = [userAboutdata mutableCopy];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    

}


@end
