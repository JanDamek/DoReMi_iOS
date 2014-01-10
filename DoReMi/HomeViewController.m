//
//  HomeViewController.m
//  DoReMi
//
//  Created by Jan Damek on 29.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize bg;

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

-(void)singlePlayer:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.aktHra.dvaHraci = NO;
    
    UIViewController *c = [self.storyboard instantiateViewControllerWithIdentifier:@"KategorieView"];
    [self.navigationController pushViewController:c animated:YES];
}

-(void)dualPlayer:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.aktHra.dvaHraci = YES;
    
    UIViewController *c = [self.storyboard instantiateViewControllerWithIdentifier:@"KategorieView"];
    [self.navigationController pushViewController:c animated:YES];
}

-(IBAction)bgBrown:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.bg = @"bg-brown.png";
    [self nastavBg];
}
-(IBAction)bgCity:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.bg = @"bg-city.png";
    [self nastavBg];
}
-(IBAction)bgPurple:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.bg = @"bg-purple.png";
    [self nastavBg];
}
-(IBAction)bgBlur:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.bg = @"bg-blur.png";
    [self nastavBg];
}
-(IBAction)bgGrey:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.bg = @"bg-grey.png";
    [self nastavBg];
}
-(IBAction)bgDefault:(id)sender{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.nastaveni.bg = @"bg-default.png";
    [self nastavBg];
}

-(void)aboutus:(id)sender{
    //zobrazeni web page, zobrazeni webove stranky primo v prohlizeci
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.doremiapp.com"]];
}

-(void)facebook:(id)sender{
    //zobrazeni web page, zobrazeni webove stranky primo v prohlizeci
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com"]];
}

-(void)twitter:(id)sender{
    //zobrazeni web page, zobrazeni webove stranky primo v prohlizeci
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com"]];
}

-(void)appstore:(id)sender{
    //zobrazeni web page, zobrazeni webove stranky primo v prohlizeci
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/radio-cas-rock/id520039922?l=cs&ls=1&mt=8"]];
}


@end
