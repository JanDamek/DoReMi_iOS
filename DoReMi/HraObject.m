//
//  hra.m
//  DoReMi
//
//  Created by Jan Damek on 28.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "HraObject.h"
#import "AppDelegate.h"

@implementation HraObject

@synthesize skryte ,cerne, bile, casDruhyHrac, casPrvniHrac, dvaHraci, kladneDruhyHrac, kladnePrvniHrac, zaporneDruhyHrac, zapornePrvniHrac, aktKategorie, prvniVyber, druhyVyber, aktHrac;

-(id)init{
    self = [super init];
    if (self){
        self.prvniVyber = -1;
        self.druhyVyber = -1;
        self.aktHrac = -1;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.cerne = [aDecoder decodeObjectForKey:@"cerne"];
        self.bile = [aDecoder decodeObjectForKey:@"bile"];
        self.skryte = [aDecoder decodeObjectForKey:@"skryte"];
        self.casDruhyHrac = [aDecoder decodeFloatForKey:@"cas_hry_druhy"];
        self.casPrvniHrac = [aDecoder decodeFloatForKey:@"cas_hry_prvni"];
        self.dvaHraci = [aDecoder decodeBoolForKey:@"dva_hraci"];
        self.kladneDruhyHrac = [aDecoder decodeIntForKey:@"kladne_druhy"];
        self.kladnePrvniHrac = [aDecoder decodeIntForKey:@"kladne_prvni"];
        self.zaporneDruhyHrac = [aDecoder decodeIntForKey:@"zaporne_druhy"];
        self.zapornePrvniHrac = [aDecoder decodeIntForKey:@"zaporne_prvni"];
        self.aktKategorie = [aDecoder decodeIntForKey:@"kategorie"];
        self.prvniVyber = [aDecoder decodeIntForKey:@"prvni_vyber"];
        self.druhyVyber = [aDecoder decodeIntForKey:@"druhy_vyber"];
        self.aktHrac = [aDecoder decodeIntForKey:@"akt_hrac"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.cerne forKey:@"cerne"];
    [aCoder encodeObject:self.bile forKey:@"bile"];
    [aCoder encodeObject:self.skryte forKey:@"skryte"];
    [aCoder encodeFloat:self.casDruhyHrac forKey:@"cas_hry_druhy"];
    [aCoder encodeFloat:self.casPrvniHrac forKey:@"cas_hry_prvni"];
    [aCoder encodeBool:self.dvaHraci forKey:@"dva_hraci"];
    [aCoder encodeInt:self.kladneDruhyHrac forKey:@"kladne_druhy"];
    [aCoder encodeInt:self.kladnePrvniHrac forKey:@"kladne_prvni"];
    [aCoder encodeInt:self.zaporneDruhyHrac forKey:@"zaporne_druhy"];
    [aCoder encodeInt:self.zapornePrvniHrac forKey:@"zaporne_prvni"];
    [aCoder encodeInt:self.aktKategorie forKey:@"kategorie"];
    [aCoder encodeInt:self.prvniVyber forKey:@"prvni_vyber"];
    [aCoder encodeInt:self.druhyVyber forKey:@"druhy_vyber"];
    [aCoder encodeInt:self.aktHrac forKey:@"akt_hrac"];
}

-(void)makeNew{
    //priprava nove hry pro zadanou kategorii a vybrany pocet hracu
    prvniVyber = -1;
    druhyVyber = -1;
    aktHrac = -1;
    
    kladnePrvniHrac = 0;
    kladneDruhyHrac = 0;
    
    zapornePrvniHrac = 0;
    zaporneDruhyHrac = 0;
    
    casPrvniHrac = 0.0;
    casDruhyHrac = 0.0;
    
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSMutableArray *k = [d.nastaveni.kategorie objectAtIndex:aktKategorie];

    [k shuffle];
    cerne = [k copy];
    
    [k shuffle];
    bile = [k copy];
    
    skryte = [[NSMutableArray alloc] init];
}

@end
