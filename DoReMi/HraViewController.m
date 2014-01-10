//
//  HraViewController.m
//  DoReMi
//
//  Created by Jan Damek on 28.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "HraViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreMIDI/CoreMIDI.h>

@implementation HraViewController

static float cas_otaceni = 0.5; // cas v sekundach
static float cas_zobrazeni_rozhodnuti = 0.2;
static float cas_schovani_rozhodnuti = 0.2;
static float cas_semafor = 1.2;
static float cas_zobrazeni_plus_jedna = 0.4;

@synthesize semafor_zelena, semafor_cervena, scoreboard_player2, scoreboard_player1, casomira, cerne, bile, body_cervene_player_1, body_cervene_player_2, body_zelene_player_1, body_zelene_player_2, rozhodnutiPopOver, rozhodnutiBila, rozhodnutiCerna, plusJedna, plusCervena;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)nastavBg{
    self.bg.image = [UIImage imageNamed:self.d.nastaveni.bg];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    buttonSize = [(UIButton*)[bile objectAtIndex:0] frame];
    [rozhodnutiPopOver setHidden:YES];
    rozhodnutiPopOver.layer.cornerRadius = 30.0;
    rozhodnutiPopOver.alpha = 0;
    
    klavir = [[Klaviatura alloc]init];
    
    [self nastavBg];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.d.nastaveni.aktHra.dvaHraci){
        [scoreboard_player2 setHidden:NO];
        [scoreboard_player1 setFrame:CGRectMake(749, 276, 120, 102)];
    }else{
        [scoreboard_player2 setHidden:YES];
        [scoreboard_player1 setFrame:CGRectMake(813, 276, 120, 102)];
    }
    
    semafor_cervena.image = [UIImage imageNamed:semafor_cervena_off];
    semafor_zelena.image = [UIImage imageNamed:semafor_zelena_off];
    
    for (UIButton *b in bile) {
        [b setImage:[UIImage imageNamed:bily_rub_karty] forState:UIControlStateNormal];
        [b setHidden:NO];
    }
    
    for (UIButton *b in cerne) {
        [b setImage:[UIImage imageNamed:cerny_rub_karty] forState:UIControlStateNormal];
        [b setHidden:NO];
    }
    
    [self nastavDisplay];
}

-(void)nastavDisplay{
    body_cervene_player_1.text = [NSString stringWithFormat:@"%02d",self.game.zapornePrvniHrac];
    body_cervene_player_2.text = [NSString stringWithFormat:@"%02d",self.game.zaporneDruhyHrac];
    
    body_zelene_player_1.text = [NSString stringWithFormat:@"%02d",self.game.kladnePrvniHrac];
    body_zelene_player_2.text = [NSString stringWithFormat:@"%02d",self.game.kladneDruhyHrac];
    
    int hod = round(self.game.casPrvniHrac/3600);
    int min_c = self.game.casPrvniHrac - (hod*3600);
    int min = round(min_c/60);
    int sec = min_c - (min*60);
    casomira.text = [NSString stringWithFormat:@"%01d:%02d:%02d", hod, min, sec];
    
    for (NSNumber *karta in self.game.skryte) {
        for (UIButton *b in bile) {
            if ((b.tag) == [karta intValue]){
                [b setHidden:YES];
            }
        }
        for (UIButton *b in cerne) {
            if (b.tag == [karta intValue]){
                [b setHidden:YES];
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backBtn:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Potvrzení" message:@"Opravdu ukoncit hru?" delegate:self cancelButtonTitle:@"Ne" otherButtonTitles:@"Ano", nil];
    alert.tag = 1;
    [alert show];
}
-(AppDelegate *)d{
    return (AppDelegate*)[[UIApplication sharedApplication]delegate];
}

-(HraObject *)game{
    return self.d.nastaveni.aktHra;
}

-(void)vyberKartickyProOtoceni:(id)sender{
    //oznaceni karty a jeji otoceni, vyhodnoceni vyberu
    UIButton *b = (UIButton*)sender;
    if (b.tag>=16){
        bilaOldPos = b.frame;
    }else{
        cernaOldPos = b.frame;
    }
    
    if (self.game.prvniVyber==-1){
        //je to prni karticka
        self.game.prvniVyber = b.tag;
    } else {
        //je to druhy vyber
        self.game.druhyVyber = b.tag;
    }
    
    buttonToRotate = b;
    
    [self doRotateButton];
}

-(void)doRotateButton{
    [UIView beginAnimations:@"rotateButton" context:nil];
    [UIView setAnimationDuration:cas_otaceni/2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    [buttonToRotate setFrame:CGRectMake(buttonToRotate.frame.origin.x+(buttonSize.size.width/2), buttonToRotate.frame.origin.y, 0, buttonToRotate.frame.size.height)];
    [UIView commitAnimations];
    
    for (UIButton *bt in bile) {
        bt.enabled = NO;
    }
    for (UIButton *bt in cerne) {
        bt.enabled = NO;
    }
}
-(void)otocZpet{
    [UIView beginAnimations:@"rotateButton" context:nil];
    [UIView setAnimationDuration:cas_otaceni/2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStopBack:finished:context:)];
    for (UIButton *b in bile) {
        if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber)
            [b setFrame:CGRectMake(b.frame.origin.x+(buttonSize.size.width/2), b.frame.origin.y, 0, b.frame.size.height)];
    }
    for (UIButton *b in cerne) {
        if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber)
            [b setFrame:CGRectMake(b.frame.origin.x+(buttonSize.size.width/2), b.frame.origin.y, 0, b.frame.size.height)];
    }
    [UIView commitAnimations];
}
- (void)animationDidStopBack:(NSString*)animationID finished:(BOOL)finished context:(void *)context {
    [UIView beginAnimations:@"rotateButtonFull" context:nil];
    [UIView setAnimationDuration:cas_otaceni/2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStopBackFull:finished:context:)];
    for (UIButton *b in bile) {
        if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber){
            [b setImage:[UIImage imageNamed:bily_rub_karty] forState:UIControlStateNormal];
            [b setFrame:CGRectMake(b.frame.origin.x-(buttonSize.size.width/2), b.frame.origin.y, buttonSize.size.width, b.frame.size.height)];
        }
    }
    for (UIButton *b in cerne) {
        if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber){
            [b setImage:[UIImage imageNamed:cerny_rub_karty] forState:UIControlStateNormal];
            [b setFrame:CGRectMake(b.frame.origin.x-(buttonSize.size.width/2), b.frame.origin.y, buttonSize.size.width, b.frame.size.height)];
        }
    }
    [UIView commitAnimations];
}
- (void)animationDidStopBackFull:(NSString*)animationID finished:(BOOL)finished context:(void *)context {
    self.game.prvniVyber = -1;
    self.game.druhyVyber = -1;
    for (UIButton *b in bile) {
        [b setEnabled:YES];
    }
    for (UIButton *b in cerne){
        [b setEnabled:YES];
    }
}
- (void)animationDidStop:(NSString*)animationID finished:(BOOL)finished context:(void *)context {
    //nasatveni lice karticky
    if (buttonToRotate.tag >=16){
        UIImage *img = [UIImage imageNamed:[(otazka*)[self.game.bile objectAtIndex:buttonToRotate.tag-16] bila]];
        [buttonToRotate setImage:img forState:UIControlStateNormal];
        rozhodnutiBila.image = img;
    }else{
        UIImage *img = [UIImage imageNamed:[(otazka*)[self.game.cerne objectAtIndex:buttonToRotate.tag-1] cerna]];
        [buttonToRotate setImage:img forState:UIControlStateNormal];
        rozhodnutiCerna.image = img;
    }
    
    [UIView beginAnimations:@"rotateButtonFull" context:nil];
    [UIView setAnimationDuration:cas_otaceni/2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStopFull:finished:context:)];
    
    [buttonToRotate setFrame:CGRectMake(buttonToRotate.frame.origin.x-(buttonSize.size.width/2), buttonToRotate.frame.origin.y, buttonSize.size.width, buttonToRotate.frame.size.height)];
    [UIView commitAnimations];
}
- (void)animationDidStopFull:(NSString*)animationID finished:(BOOL)finished context:(void *)context {
    if (self.game.druhyVyber!=-1){
        //otocena druha karticka mozno resit volbu
        [rozhodnutiPopOver setHidden:NO];
        
        [UIView beginAnimations:@"zobrazPopover" context:nil];
        [UIView setAnimationDuration:cas_zobrazeni_rozhodnuti];
        [rozhodnutiPopOver setAlpha:1];
        
        for (UIButton *b in bile) {
            if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber){
                bilaOldPos = b.frame;
                [b setFrame:CGRectMake(rozhodnutiCerna.frame.origin.x+rozhodnutiPopOver.frame.origin.x, rozhodnutiPopOver.frame.origin.y+122, 250, 250)];
            }
        }
        for (UIButton *b in cerne) {
            if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber){
                cernaOldPos = b.frame;
                [b setFrame:CGRectMake(rozhodnutiBila.frame.origin.x+rozhodnutiPopOver.frame.origin.x, rozhodnutiPopOver.frame.origin.y+122, 250, 250)];
            }
        }
        
        [UIView commitAnimations];
    }else{
        if (self.game.prvniVyber>=16){
            for (UIButton *bt in cerne) {
                bt.enabled = YES;
            }
        }else{
            for (UIButton *bt in bile) {
                bt.enabled = YES;
            }
        }
    }
}
-(void)shovejPopOver{
    [self nastavDisplay];
    
    [UIView beginAnimations:@"shovejPopover" context:nil];
    [UIView setAnimationDuration:cas_schovani_rozhodnuti];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStopPopoverHide:finished:context:)];
    [rozhodnutiPopOver setAlpha:0];
    
    for (UIButton *b in bile) {
        if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber){
            [b setFrame:bilaOldPos];
        }
    }
    for (UIButton *b in cerne) {
        if (b.tag == self.game.prvniVyber || b.tag == self.game.druhyVyber){
            [b setFrame:cernaOldPos];
        }
    }
    
    [UIView commitAnimations];
    
}
- (void)animationDidStopPopoverHide:(NSString*)animationID finished:(BOOL)finished context:(void *)contex{
    [rozhodnutiPopOver setHidden:YES];
    
    [self otocZpet];
}

-(void)zhasniSemafor{
    semafor_cervena.image = [UIImage imageNamed:semafor_cervena_off];
    semafor_zelena.image = [UIImage imageNamed:semafor_zelena_off];
}
-(void)nastav_zhasni{
    [NSTimer scheduledTimerWithTimeInterval:cas_semafor target:self selector:@selector(zhasniSemafor) userInfo:nil repeats:NO];
}

-(void)dejZelenou{
    semafor_zelena.image = [UIImage imageNamed:semafor_zelena_on];
    [self nastav_zhasni];
    
    plusJedna.alpha = 0;
    plusJedna.hidden = NO;
    plusJedna.frame = CGRectMake(self.bg.frame.size.width/2-5, self.bg.frame.size.height/2-5, 10, 10);
    
    [UIView beginAnimations:@"plusjedna" context:nil];
    [UIView setAnimationDuration:cas_zobrazeni_plus_jedna];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(plusjednaIsShow:finished:context:)];
    
    plusJedna.alpha = 1;
    plusJedna.frame = CGRectMake(self.bg.frame.size.width/2-150, self.bg.frame.size.height/2-150, 300, 300);
    
    [UIView commitAnimations];
}
- (void)plusjednaIsShow:(NSString*)animationID finished:(BOOL)finished context:(void *)contex{
    [UIView beginAnimations:@"plusjedna" context:nil];
    [UIView setAnimationDuration:cas_zobrazeni_plus_jedna];
    
    plusJedna.alpha = 0;
    plusJedna.frame = CGRectMake(scoreboard_player1.frame.origin.x+body_zelene_player_1.frame.origin.x, scoreboard_player1.frame.origin.y+body_zelene_player_1.frame.origin.y, body_zelene_player_1.frame.size.width, body_zelene_player_1.frame.size.height);
    
    [UIView commitAnimations];
    
}
-(void)dejCervenou{
    semafor_cervena.image = [UIImage imageNamed:semafor_cercena_on];
    [self nastav_zhasni];
    
    plusCervena.alpha = 0;
    plusCervena.hidden = NO;
    plusCervena.frame = CGRectMake(self.bg.frame.size.width/2-5, self.bg.frame.size.height/2-5, 10, 10);
    
    [UIView beginAnimations:@"pluscervena" context:nil];
    [UIView setAnimationDuration:cas_zobrazeni_plus_jedna];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(plusCervenaIsShow:finished:context:)];
    
    plusCervena.alpha = 1;
    plusCervena.frame = CGRectMake(self.bg.frame.size.width/2-150, self.bg.frame.size.height/2-150, 300, 300);
    
    [UIView commitAnimations];
    
}
- (void)plusCervenaIsShow:(NSString*)animationID finished:(BOOL)finished context:(void *)contex{
    [UIView beginAnimations:@"pluscervena" context:nil];
    [UIView setAnimationDuration:cas_zobrazeni_plus_jedna];
    
    plusCervena.alpha = 0;
    plusCervena.frame = CGRectMake(scoreboard_player1.frame.origin.x+body_cervene_player_1.frame.origin.x, scoreboard_player1.frame.origin.y+body_cervene_player_1.frame.origin.y, body_cervene_player_1.frame.size.width, body_cervene_player_1.frame.size.height);
    
    [UIView commitAnimations];
    
}
-(void)stejneKarticky:(id)sender{
    int prvni = self.game.prvniVyber-1;
    int druhy = self.game.druhyVyber-1;
    
    NSString *pr;
    NSString *dr;
    if (self.game.prvniVyber>=16) {
        prvni = self.game.prvniVyber - 16;
        pr = [(otazka*)[self.game.bile objectAtIndex:prvni] nazev];
    }else
        pr = [(otazka*)[self.game.cerne objectAtIndex:prvni] nazev];
    
    if (self.game.druhyVyber>=16){
        druhy = self.game.druhyVyber - 16;
        dr = [(otazka*)[self.game.bile objectAtIndex:druhy] nazev];
    }else
        dr = [(otazka*)[self.game.cerne objectAtIndex:druhy] nazev];
    
    if ([pr isEqualToString:dr]){
        self.game.kladnePrvniHrac +=1;
        [self.game.skryte addObject:[NSNumber numberWithInt:self.game.prvniVyber]];
        [self.game.skryte addObject:[NSNumber numberWithInt:self.game.druhyVyber]];
        [self dejZelenou];
    }else{
        self.game.zapornePrvniHrac +=1;
        [self dejCervenou];
    }
    [self shovejPopOver];
}
-(void)ruzneKarticky:(id)sender{
    int prvni = self.game.prvniVyber-1;
    int druhy = self.game.druhyVyber-1;
    NSString *pr;
    NSString *dr;
    if (self.game.prvniVyber>=16) {
        prvni = self.game.prvniVyber - 16;
        pr = [(otazka*)[self.game.bile objectAtIndex:prvni] nazev];
    }else
        pr = [(otazka*)[self.game.cerne objectAtIndex:prvni] nazev];

    if (self.game.druhyVyber>=16){
        druhy = self.game.druhyVyber - 16;
        dr = [(otazka*)[self.game.bile objectAtIndex:druhy] nazev];
    }else
        dr = [(otazka*)[self.game.cerne objectAtIndex:druhy] nazev];
    
    if (![pr isEqualToString:dr]){
        self.game.kladnePrvniHrac +=1;
        [self dejZelenou];
    }else {
        self.game.zapornePrvniHrac +=1;
        [self.game.skryte addObject:[NSNumber numberWithInt:self.game.prvniVyber]];
        [self.game.skryte addObject:[NSNumber numberWithInt:self.game.druhyVyber]];
        [self dejCervenou];
    }
    
    [self shovejPopOver];
}

-(void)klavirDown:(id)sender{
    [klavir zmacklaKlavesa:((UIButton*)sender).tag];
}
-(void)klavirUp:(id)sender{
    [klavir povolenaKlavesa:((UIButton*)sender).tag];
}

-(void)hratZnova:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Potvrzení" message:@"Opravdu ukoncit hru a spustit novou?" delegate:self cancelButtonTitle:@"Ne" otherButtonTitles:@"Ano", nil];
    alert.tag = 0;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1){
        if(buttonIndex == 1)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    if (alertView.tag == 0){
        if(buttonIndex == 1)
        {
            [self.d.nastaveni.aktHra makeNew];
            [self nastavDisplay];
        }
    }
}

-(void)appstore:(id)sender{
    //zobrazeni web page, zobrazeni webove stranky primo v prohlizeci
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/radio-cas-rock/id520039922?l=cs&ls=1&mt=8"]];
}

-(void)aboutus:(id)sender{
    //zobrazeni web page, zobrazeni webove stranky primo v prohlizeci
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.doremiapp.com"]];
}

@end
