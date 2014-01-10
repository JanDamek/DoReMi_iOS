//
//  HraViewController.h
//  DoReMi
//
//  Created by Jan Damek on 28.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "HraObject.h"
#import "Klaviatura.h"

static NSString *cerny_rub_karty = @"card-black.png";

static NSString *bily_rub_karty = @"card-white.png";

static NSString *semafor_zelena_on = @"light_green_on.png";
static NSString *semafor_zelena_off = @"light_green_off.png";

static NSString *semafor_cercena_on = @"light_red_on.png";
static NSString *semafor_cervena_off = @"light_red_off.png";


@interface HraViewController : UIViewController {
    UIButton *buttonToRotate;
    CGRect buttonSize;
    CGRect bilaOldPos;
    CGRect cernaOldPos;
    
    Klaviatura *klavir;
}

@property (strong, nonatomic) IBOutlet UIImageView *bg;
@property (strong, nonatomic) IBOutlet UIImageView *plusJedna;
@property (strong, nonatomic) IBOutlet UIImageView *plusCervena;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *bile;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *cerne;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *klaviatura;

@property (strong, nonatomic) IBOutlet UIView *rozhodnutiPopOver;
@property (strong, nonatomic) IBOutlet UIImageView *rozhodnutiBila;
@property (strong, nonatomic) IBOutlet UIImageView *rozhodnutiCerna;

@property (strong, nonatomic) IBOutlet UIImageView *semafor_cervena;
@property (strong, nonatomic) IBOutlet UIImageView *semafor_zelena;

@property (strong, nonatomic) IBOutlet UILabel *casomira;

@property (strong, nonatomic) IBOutlet UIView *scoreboard_player1;
@property (strong, nonatomic) IBOutlet UILabel *body_zelene_player_1;
@property (strong, nonatomic) IBOutlet UILabel *body_cervene_player_1;

@property (strong, nonatomic) IBOutlet UIView *scoreboard_player2;
@property (strong, nonatomic) IBOutlet UILabel *body_zelene_player_2;
@property (strong, nonatomic) IBOutlet UILabel *body_cervene_player_2;

@property (readonly) AppDelegate *d;
@property (readonly) HraObject *game;

-(IBAction)vyberKartickyProOtoceni:(id)sender;

-(IBAction)backBtn:(id)sender;

-(IBAction)stejneKarticky:(id)sender;
-(IBAction)ruzneKarticky:(id)sender;

-(IBAction)klavirDown:(id)sender;
-(IBAction)klavirUp:(id)sender;

-(IBAction)hratZnova:(id)sender;

-(IBAction)aboutus:(id)sender;
-(IBAction)appstore:(id)sender;



@end
