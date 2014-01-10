//
//  NastaveniAKonstanty.m
//  DoReMi
//
//  Created by Jan Damek on 28.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "NastaveniAKonstanty.h"

@implementation otazka

@synthesize nazev, cerna, bila, bila_txt, cerna_txt, klavesa_tag;

+(id)initOtazka:(NSString*)_nazev bila:(NSString *)_bila cerna:(NSString *)_cerna klavesa:(int)_klavesa_tag{
    otazka *s = [[super alloc] init];
    s.nazev = _nazev;
    s.bila = _bila;
    s.bila_txt = nil;
    s.cerna = _cerna;
    s.cerna_txt = nil;
    s.klavesa_tag = _klavesa_tag;
    
    return s;
}
+(id)initOtazka:(NSString *)_nazev bila:(NSString *)_bila cerna_txt:(NSString *)_cerna klavesa:(int)_klavesa_tag{
    
    otazka *s = [[super alloc] init];
    s.nazev = _nazev;
    s.bila = _bila;
    s.bila_txt = nil;
    s.cerna = nil;
    s.cerna_txt = _cerna;
    s.klavesa_tag = _klavesa_tag;
    
    return s;
}
+(id)initOtazka:(NSString *)_nazev bila_txt:(NSString *)_bila cerna:(NSString *)_cerna klavesa:(int)_klavesa_tag{
    otazka *s = [[super alloc] init];
    s.nazev = _nazev;
    s.bila = nil;
    s.bila_txt = _bila;
    s.cerna = _cerna;
    s.cerna_txt = nil;
    s.klavesa_tag = _klavesa_tag;
    
    return s;
}
+(id)initOtazka:(NSString *)_nazev bila_txt:(NSString *)_bila cerna_txt:(NSString *)_cerna{
    otazka *s = [[super alloc] init];
    s.nazev = _nazev;
    s.bila = nil;
    s.bila_txt = _bila;
    s.cerna = nil;
    s.cerna_txt = _cerna;
    s.klavesa_tag = -1;
    
    return s;
}
+(id)initOtazka:(NSString *)_nazev bila_txt:(NSString *)_bila cerna_txt:(NSString *)_cerna klavesa:(int)_klavesa_tag{
    otazka *s = [[super alloc] init];
    s.nazev = _nazev;
    s.bila = nil;
    s.bila_txt = _bila;
    s.cerna = nil;
    s.cerna_txt = _cerna;
    s.klavesa_tag = _klavesa_tag;
    
    return s;
}
+(id)initOtazka:(NSString *)_nazev bila:(NSString *)_bila bila_txt:(NSString *)_bila_txt cerna:(NSString *)_cerna cerna_txt:(NSString *)_cerna_txt klavesa:(int)_klavesa_tag{    otazka *s = [[super alloc] init];
    s.nazev = _nazev;
    s.bila = _bila;
    s.bila_txt = _bila_txt;
    s.cerna = _cerna;
    s.cerna_txt = _cerna_txt;
    s.klavesa_tag = _klavesa_tag;
    
    return s;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.nazev = [aDecoder decodeObjectForKey:@"nazev"];
        self.bila = [aDecoder decodeObjectForKey:@"bila"];
        self.cerna = [aDecoder decodeObjectForKey:@"cerna"];
        self.bila_txt = [aDecoder decodeObjectForKey:@"bila_txt"];
        self.cerna_txt = [aDecoder decodeObjectForKey:@"cerna_txt"];
        self.klavesa_tag = [aDecoder decodeIntForKey:@"klavesa_tag"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.nazev forKey:@"nazev"];
    [aCoder encodeObject:self.bila forKey:@"bila"];
    [aCoder encodeObject:self.cerna forKey:@"cerna"];
    [aCoder encodeObject:self.bila_txt forKey:@"bila_txt"];
    [aCoder encodeObject:self.cerna_txt forKey:@"cerna_txt"];
    [aCoder encodeInt:self.klavesa_tag forKey:@"klavesa_tag"];
}

@end

@implementation NastaveniAKonstanty

@synthesize kategorie;

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.kategorie = [aDecoder decodeObjectForKey:@"kategorie"];
        self.aktHra = [aDecoder decodeObjectForKey:@"hra"];
        self.bg = [aDecoder decodeObjectForKey:@"bg"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.kategorie forKey:@"kategorie"];
    [aCoder encodeObject:self.aktHra forKey:@"hra"];
    [aCoder encodeObject:self.bg forKey:@"bg"];
}

-(id)init{
    self = [super init];
    self.aktHra = [[HraObject alloc]init];
    
    self.bg = @"bg-default.png";
    
    kategorie =[NSArray arrayWithObjects:
                
                //kategorie 1
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"a" bila:@"card-a-white.png" cerna:@"card-a-black.png" klavesa:-1],
                 [otazka initOtazka:@"h" bila:@"card-h-white.png" cerna:@"card-h-black.png" klavesa:-1],
                 
                 [otazka initOtazka:@"c1" bila:@"card-c1-white.png" cerna:@"card-c1-black.png" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"card-D1-white.png" cerna:@"card-D1-black.png" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"card-E1-white.png" cerna:@"card-E1-black.png" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"card-F1-white.png" cerna:@"card-F1-black.png" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"card-G1-white.png" cerna:@"card-G1-black.png" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"card-A1-white.png" cerna:@"card-A1-black.png" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"card-H1-white.png" cerna:@"card-H1-black.png" klavesa:-1],
                 
                 [otazka initOtazka:@"c2" bila:@"card-c2-white.png" cerna:@"card-c2-black.png" klavesa:-1],
                 [otazka initOtazka:@"d2" bila:@"card-D2-white.png" cerna:@"card-D2-black.png" klavesa:-1],
                 [otazka initOtazka:@"e2" bila:@"card-e2-white.png" cerna:@"card-e2-black.png" klavesa:-1],
                 [otazka initOtazka:@"f2" bila:@"card-f2-white.png" cerna:@"card-f2-black.png" klavesa:-1],
                 [otazka initOtazka:@"g2" bila:@"card-G2-white.png" cerna:@"card-G2-black.png" klavesa:-1],
                 [otazka initOtazka:@"a2" bila:@"card-A2-white.png" cerna:@"card-A2-black.png" klavesa:-1],
                 nil],
                
                //kategorie 2
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil],
                
                //kategorie 3
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil],
                
                //kategorie 4
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil],
                
                //kategorie 5
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil],
                
                //kategorie 6
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil],
                
                //kategorie 7
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil],
                
                //kategorie 8
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil],
                
                //kategorie 9
                [NSMutableArray arrayWithObjects:
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c2" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"c1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"d1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"e1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"f1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"g1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"a1" bila:@"" cerna:@"" klavesa:-1],
                 [otazka initOtazka:@"h1" bila:@"" cerna:@"" klavesa:-1],
                 nil]
                
                ,nil];
    
    return self;
}

@end
