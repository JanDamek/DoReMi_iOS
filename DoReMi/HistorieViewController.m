//
//  HistorieViewController.m
//  DoReMi
//
//  Created by Jan Damek on 29.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "HistorieViewController.h"
#import "AppDelegate.h"

@interface HistorieViewController ()

@end

@implementation HistorieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)nastavBg{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.bg.image = [UIImage imageNamed:d.nastaveni.bg];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self nastavBg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closeBtn:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
