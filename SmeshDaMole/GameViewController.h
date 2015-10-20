//
//  ViewController.h
//  SmeshDaMole
//
//  Created by Khalil Ciret on 19/10/2015.
//  Copyright © 2015 Kay-prod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolBox/AudioToolBox.h>
#import "Game.h"
@interface GameViewController : UIViewController <AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer * audioPlayer;
@property (weak, nonatomic) IBOutlet UILabel *labelStart;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *allMoles;
@property (strong, nonatomic) Game* gameModel;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

