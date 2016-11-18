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
  NSMutableArray *arrayAboutList;
    DetailsOfStories *viewController;
}

@end

@implementation DetailOfUser
@synthesize arrayAboutList;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Stories"];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    //NSMutableArray *arrayForUse = [arrayAboutList[indexPath.row]];
  // NSMutableArray *array1 = [arrayAboutList[indexPath.row] copy];
   
    //UILabel *indexOfStory=[(UILabel *)cell viewWithTag:1];
   // indexOfStory.text=[NSString stringWithFormat:@"Story %d", indexPath.row+1];
    UILabel *title=[(UILabel *)cell viewWithTag:2];
    title.text=[NSString stringWithFormat:@"%@", [arrayAboutList[indexPath.row] valueForKey:@"title"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
    viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailsOfStories"];
   viewController.descriptionList = [arrayAboutList[indexPath.row] mutableCopy];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}
@end
