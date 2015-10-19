//
//  ViewController.m
//  SmeshDaMole
//
//  Created by Khalil Ciret on 19/10/2015.
//  Copyright © 2015 Kay-prod. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *backGroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Grass.png"]];
    [self.view addSubview:backGroundView];
    for (UIImageView *img in self.allMoles)
    {
            img.image = [UIImage imageNamed:@"Mole.png"];
        img.alpha = 0.0f;
    }
    
   // Ca sera utile pour faire le 3, 2, 1... Ya know? NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(newMoleApparition) userInfo:nil repeats:NO ];
   // NSRunLoop *rollingAround = [NSRunLoop currentRunLoop];
    //[rollingAround addTimer:timer forMode:NSDefaultRunLoopMode];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self newMoleApparition];
}


// Make a new Mole Appears at the screen
- (void) newMoleApparition
{
    UIImageView *newMole;
    do {
        newMole = self.allMoles[arc4random()  % [self.allMoles count]];
    } while (newMole.alpha == 1.0f);
    
    NSTimer * nextApp= [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(newMoleApparition) userInfo:nil repeats:NO ];
    NSDictionary *mole = [[NSDictionary alloc] initWithObjects:@[newMole] forKeys:@[@"mole"]];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(moleDisparition:) userInfo:mole repeats:NO ];
    NSRunLoop *rollingAround = [NSRunLoop currentRunLoop];
    [rollingAround addTimer:timer forMode:NSDefaultRunLoopMode];
    [rollingAround addTimer:nextApp forMode:NSDefaultRunLoopMode];
    
    newMole.alpha = 1.0f;
    
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch =  [[event allTouches] anyObject];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) moleDisparition: (NSTimer*) timer{
    if (!timer)
    {
        //TODO : Change the code to add an animation
    }
    UIImageView *mole=[timer.userInfo valueForKey:@"mole"];
    mole.alpha=0.0f;
    
}

@end
