//
//  Klaviatura.h
//  DoReMi
//
//  Created by Jan Damek on 31.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#import <AVFoundation/AVFoundation.h>

@interface Klaviatura : NSObject<AVAudioPlayerDelegate>{
    NSMutableDictionary *zmackle;
    NSMutableDictionary *hraje;
}

-(void)zmacklaKlavesa:(int)klavesa;
-(void)povolenaKlavesa:(int)klavesa;

@end
