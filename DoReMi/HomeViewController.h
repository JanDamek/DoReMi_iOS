//
//  HomeViewController.h
//  DoReMi
//
//  Created by Jan Damek on 29.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *bg;

-(IBAction)singlePlayer:(id)sender;
-(IBAction)dualPlayer:(id)sender;

-(IBAction)facebook:(id)sender;
-(IBAction)twitter:(id)sender;
-(IBAction)aboutus:(id)sender;
-(IBAction)appstore:(id)sender;

-(IBAction)bgBrown:(id)sender;
-(IBAction)bgCity:(id)sender;
-(IBAction)bgPurple:(id)sender;
-(IBAction)bgBlur:(id)sender;
-(IBAction)bgGrey:(id)sender;
-(IBAction)bgDefault:(id)sender;


@end
