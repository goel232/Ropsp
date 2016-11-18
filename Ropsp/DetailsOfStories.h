//
//  DetailsOfStories.h
//  Ropsp
//
//  Created by Aethon Technologies on 18/11/16.
//  Copyright © 2016 Aethon Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsOfStories : UIViewController
@property(retain,nonatomic)NSMutableArray *descriptionList;
- (IBAction)like:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;
@end
