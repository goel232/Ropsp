//
//  DetailOfUser.m
//  Ropsp
//
//  Created by Aethon Technologies on 16/11/16.
//  Copyright © 2016 Aethon Technologies. All rights reserved.
//

#import "DetailOfUser.h"
#import "DetailsOfStories.h"


@interface DetailOfUser ()<UITableViewDelegate,UITableViewDataSource>
{
  NSMutableArray *arrayAboutList,*coppyArrayAboutList;
    DetailsOfStories *viewController;
    NSInteger i;
    NSString *increasedLikeCount,*newFlag;
}

@end

@implementation DetailOfUser
@synthesize arrayAboutList;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    coppyArrayAboutList=[arrayAboutList mutableCopy];
   
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(likeCount:) name:@"NotificationForData" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(likeCount2:) name:@"NotificationForData1" object:nil];
    [self.navigationItem setTitle:@"Stories"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)likeCount :(NSNotification *)noti{

        
        increasedLikeCount = [noti object];
    
    
    [coppyArrayAboutList[i] setValue:increasedLikeCount forKey:@"likes_count"];
    
    NSLog(@"%@",[coppyArrayAboutList[i] valueForKey:@"likes_count"]);
  arrayAboutList=  [coppyArrayAboutList mutableCopy];
     [_detailTableView reloadData];
    
}
-(void)likeCount2 :(NSNotification *)noti{
    
    
    newFlag=[noti object];
    NSLog(@"%@",newFlag);

    [coppyArrayAboutList[i] setValue:newFlag forKey:@"like_flag"];
       NSLog(@"%@",[coppyArrayAboutList[i] valueForKey:@"like_flag"]);
    arrayAboutList=  [coppyArrayAboutList mutableCopy];
    [_detailTableView reloadData];
    
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
    
    
    return arrayAboutList.count;
    
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    // Similar to UITableViewCell, but
    
    UITableViewCell *cell = (UITableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    UILabel *title=[(UILabel *)cell viewWithTag:2];
    title.text=[NSString stringWithFormat:@"%@", [arrayAboutList[indexPath.row] valueForKey:@"title"]];
    UILabel *likesCount=[(UILabel *)cell viewWithTag:10];
    likesCount.text=[NSString stringWithFormat:@"Likes %@", [arrayAboutList[indexPath.row] valueForKey:@"likes_count"]];
    NSString *like_flag=[arrayAboutList[indexPath.row] valueForKey:@"like_flag"];
    NSNumber *likeFlagNumber=@([like_flag intValue]);
    int likeflagInt=[likeFlagNumber intValue];
    if(likeflagInt){
        UILabel *likeTick=[(UILabel *)cell viewWithTag:15];
        likeTick.text=@"Liked";
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        UILabel *likeTick=[(UILabel *)cell viewWithTag:15];
        likeTick.text=@"";
        cell.accessoryType = NO;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    i=indexPath.row;
    viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailsOfStories"];
   viewController.descriptionList = [arrayAboutList[indexPath.row] mutableCopy];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}
@end
