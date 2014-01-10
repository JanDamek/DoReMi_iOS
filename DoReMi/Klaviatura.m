//
//  Klaviatura.m
//  DoReMi
//
//  Created by Jan Damek on 31.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "Klaviatura.h"

@implementation Klaviatura

-(id)init{
    self = [super init];
    if (self){
        zmackle = [[NSMutableDictionary alloc]init];
        hraje = [[NSMutableDictionary alloc]init];
    }
    return self;
}

-(void)zmacklaKlavesa:(int)klavesa{
    [zmackle setObject:@"press" forKey:[NSString stringWithFormat:@"%d",klavesa]];
    
    [self zacniHrat:klavesa];
}
-(void)povolenaKlavesa:(int)klavesa{
    [zmackle removeObjectForKey:[NSString stringWithFormat:@"%d",klavesa]];
    
    [self ukonciHrat:klavesa];
}

-(void)zacniHrat:(int)klavesa{
    
    NSString *fileName = [NSString stringWithFormat:@"%04d", klavesa];
    
    NSLog(@"%@", fileName);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"wav"];
    
    if (path){
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: path];
        AVAudioPlayer *theAudio=[[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:NULL];
        theAudio.volume = 1.0;
        theAudio.delegate = self;
        [theAudio prepareToPlay];
        [theAudio play];
        [hraje setObject:theAudio forKey:[NSString stringWithFormat:@"%d",klavesa]];
    }
}
-(void)ukonciHrat:(int)klavesa{
    AVAudioPlayer *player = [hraje objectForKey:[NSString stringWithFormat:@"%d",klavesa]];
    [player stop];
    [hraje removeObjectForKey:[NSString stringWithFormat:@"%d",klavesa]];
}

@end
