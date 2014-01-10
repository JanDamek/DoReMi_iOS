//
//  NastaveniAKonstanty.h
//  DoReMi
//
//  Created by Jan Damek on 28.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HraObject.h"
#import "NSMutableArray_shuffling.h"

@interface otazka : NSObject<NSCoding>

@property (copy) NSString *bila;
@property (copy) NSString *cerna;
@property (copy) NSString *bila_txt;
@property (copy) NSString *cerna_txt;
@property int klavesa_tag;
@property (copy) NSString *nazev;

+(id)initOtazka:(NSString*)_nazev bila:(NSString*)_bila cerna:(NSString*)_cerna klavesa:(int)_klavesa_tag;
+(id)initOtazka:(NSString*)_nazev bila_txt:(NSString*)_bila cerna_txt:(NSString*)_cerna;
+(id)initOtazka:(NSString*)_nazev bila_txt:(NSString*)_bila cerna_txt:(NSString*)_cerna klavesa:(int)_klavesa_tag;
+(id)initOtazka:(NSString*)_nazev bila:(NSString*)_bila cerna_txt:(NSString*)_cerna klavesa:(int)_klavesa_tag;
+(id)initOtazka:(NSString*)_nazev bila_txt:(NSString*)_bila cerna:(NSString*)_cerna klavesa:(int)_klavesa_tag;
+(id)initOtazka:(NSString*)_nazev bila:(NSString*)_bila bila_txt:(NSString*)_bila_txt cerna:(NSString*)_cerna cerna_txt:(NSString*)_cerna_txt klavesa:(int)_klavesa_tag;

@end
                                    
@interface NastaveniAKonstanty : NSObject<NSCoding>

@property (strong, nonatomic) NSArray *kategorie;
@property (strong, nonatomic) HraObject *aktHra;
@property (strong, nonatomic) NSString *bg;

@end
