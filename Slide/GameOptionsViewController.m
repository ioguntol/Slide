//  Copyright © 2016 Insi. All rights reserved.

#import "GameOptionsViewController.h"
#import "MainMenuViewController.h"

@interface GameOptionsViewController ()

@property UILabel *optionsLabel;
@property SlideButton *changeDifficultyButton;
@property SlideButton *howToPlayButton;
@property SlideButton *menuButton;
@property SlideButton *backButton;

@end


@implementation GameOptionsViewController

- (id)init {
    self = [super init];
    
    if (self) {
        self.view.backgroundColor = UIColor.whiteColor;
        self.optionsLabel = [UILabel new];
        self.optionsLabel.text = @"Game Options";
        self.optionsLabel.textAlignment = NSTextAlignmentCenter;
        self.optionsLabel.textColor = UIColor.slideBlue;
        self.optionsLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40.0];
        [self.view addSubview:self.optionsLabel];
        
        self.changeDifficultyButton = [SlideButton new];
        self.changeDifficultyButton.backgroundColor = UIColor.slideGrey;
        self.changeDifficultyButton.layer.cornerRadius = 10.0;
        self.changeDifficultyButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:23.0];
        [self.changeDifficultyButton setTitle:@"Change Difficulty" forState:UIControlStateNormal];
        [self.changeDifficultyButton setTitleColor:UIColor.slideBlue forState:UIControlStateNormal];
        [self.changeDifficultyButton addTarget:self
                                        action:@selector(changeDifficulty)
                              forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.changeDifficultyButton];
        
        self.howToPlayButton = [SlideButton new];
        self.howToPlayButton.backgroundColor = UIColor.slideGrey;
        self.howToPlayButton.layer.cornerRadius = 10.0;
        self.howToPlayButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:23.0];
        [self.howToPlayButton setTitle:@"How to Play" forState:UIControlStateNormal];
        [self.howToPlayButton setTitleColor:UIColor.slideBlue forState:UIControlStateNormal];
        [self.howToPlayButton addTarget:self
                                 action:@selector(showHowToPlay)
                       forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.howToPlayButton];
        
        self.menuButton = [SlideButton new];
        self.menuButton.backgroundColor = UIColor.slideGrey;
        self.menuButton.layer.cornerRadius = 10.0;
        self.menuButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:23.0];
        [self.menuButton setTitle:@"Menu" forState:UIControlStateNormal];
        [self.menuButton setTitleColor:UIColor.slideBlue forState:UIControlStateNormal];
        [self.menuButton addTarget:self action:@selector(menu) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.menuButton];
        
        self.backButton = [SlideButton new];
        self.backButton.backgroundColor = UIColor.slideGrey;
        self.backButton.layer.cornerRadius = 10.0;
        self.backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:23.0];
        [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
        [self.backButton setTitleColor:UIColor.slideBlue forState:UIControlStateNormal];
        [self.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.backButton];
        
        [self updateViewConstraints];
    }
    return self;
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    [self.optionsLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_bottom).multipliedBy(0.05);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(320.0);
        make.height.mas_equalTo(60.0);
    }];
    
    [self.changeDifficultyButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_bottom).multipliedBy(0.25);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(250.0);
        make.height.mas_equalTo(50.0);
    }];
    
    [self.howToPlayButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.changeDifficultyButton.mas_bottom).with.offset(8.0);
        make.centerX.width.height.equalTo(self.changeDifficultyButton);
    }];
    
    [self.menuButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.howToPlayButton.mas_bottom).with.offset(8.0);
        make.centerX.width.height.equalTo(self.changeDifficultyButton);
    }];

    [self.backButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.menuButton.mas_bottom).with.offset(8.0);
        make.centerX.width.height.equalTo(self.changeDifficultyButton);
    }];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)changeDifficulty {
    DifficultyViewController *difficultyScreen = [DifficultyViewController new];
    [self presentViewController:difficultyScreen animated:YES completion:nil];
}

- (void)showHowToPlay {
    HowToPlayViewController *howToPlayScreen = [HowToPlayViewController new];
    [self presentViewController:howToPlayScreen animated:YES completion:nil];
}

- (void)menu {
    MainMenuViewController *mainMenuScreen = [MainMenuViewController new];
    [mainMenuScreen setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:mainMenuScreen animated:YES completion:nil];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
