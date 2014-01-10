//
//  KategorieViewController.m
//  DoReMi
//
//  Created by Jan Damek on 29.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "KategorieViewController.h"
#import "AppDelegate.h"

@interface KategorieViewController ()

@end

@implementation KategorieViewController

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
	// Do any additional setup after loading the view.
    [self nastavBg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)kategorieBtn:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    UIButton *b = sender;
    d.nastaveni.aktHra.aktKategorie = b.tag;
    [d.nastaveni.aktHra makeNew];
    
    UIViewController *c = [self.storyboard instantiateViewControllerWithIdentifier:@"HraView"];
    [self.navigationController pushViewController:c animated:YES];
}

-(IBAction)backBtn:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
