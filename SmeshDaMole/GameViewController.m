//
//  ViewController.m
//  SmeshDaMole
//
//  Created by Khalil Ciret on 19/10/2015.
//  Copyright © 2015 Kay-prod. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@property(strong, nonatomic) NSMutableArray* moleAtTheScreen; //Of UI IMAGE VIEW

@end

@implementation GameViewController

//Lazy instantation
- (Game*) gameModel {
    if (!_gameModel) _gameModel = [[Game alloc] init];
    return _gameModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.moleAtTheScreen = [[NSMutableArray alloc] init];
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
    
    [self.moleAtTheScreen addObject:newMole];
    NSTimer * nextApp= [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(newMoleApparition) userInfo:nil repeats:NO ];
    NSDictionary *mole = [[NSDictionary alloc] initWithObjects:@[newMole] forKeys:@[@"mole"]];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(moleDisparition:) userInfo:mole repeats:NO ];
    NSRunLoop *rollingAround = [NSRunLoop currentRunLoop];
    [rollingAround addTimer:timer forMode:NSDefaultRunLoopMode];
    [rollingAround addTimer:nextApp forMode:NSDefaultRunLoopMode];
    
    newMole.alpha = 1.0f;
    
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches
withEvent:(UIEvent *)event {
    
    UITouch *touch =  [[event allTouches] anyObject];
    CGPoint locationTouch = [touch locationInView:self.view];
    int scoreInit = self.gameModel.score;
    
    for (UIImageView *mole in self.moleAtTheScreen) {
        if (CGRectContainsPoint(mole.frame, locationTouch))
        {
            [self moleTouched:mole];
            [self.gameModel refreshScore:true];
        }
    }
    
    //This conditions allows us to see if the score hasn't changed, implying no mole has been SMESHED
    if( scoreInit==self.gameModel.score)
    {
        [self.gameModel refreshScore:false];
    }
    self.labelScore.text = [NSString stringWithFormat:@"Score = %d", self.gameModel.score];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) moleDisparition: (NSTimer*) timer{
    UIImageView *mole=[timer.userInfo valueForKey:@"mole"];
    mole.alpha=0.0f;
    [self.moleAtTheScreen removeObject:mole];
    
}

- (void) moleTouched: (UIImageView*) mole {
    
    mole.alpha=0.0f;
    [self.moleAtTheScreen removeObject:mole];
}

    
@end
