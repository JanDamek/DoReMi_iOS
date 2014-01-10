//
//  hra.h
//  DoReMi
//
//  Created by Jan Damek on 28.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray_shuffling.h"

@interface HraObject : NSObject <NSCoding>

@property BOOL dvaHraci;
@property int aktKategorie;

@property int aktHrac;

@property int prvniVyber;
@property int druhyVyber;

@property float casPrvniHrac;
@property int kladnePrvniHrac;
@property int zapornePrvniHrac;

@property float casDruhyHrac;
@property int kladneDruhyHrac;
@property int zaporneDruhyHrac;

@property NSMutableArray *cerne;
@property NSMutableArray *bile;

@property NSMutableArray *skryte;

-(void)makeNew;

@end
