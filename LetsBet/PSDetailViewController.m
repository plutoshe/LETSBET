//
//  PSDetailViewController.m
//  LetsBet
//
//  Created by PlutoShe on 5/18/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import "PSDetailViewController.h"

@interface PSDetailViewController ()

@end

@implementation PSDetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)JoinParyA:(id)sender {
    self.callback(_row);
    UINavigationController *navController = self.navigationController;
    [navController popViewControllerAnimated:NO];

}
- (IBAction)JoinParyB:(id)sender {
    self.callback(_row);
    UINavigationController *navController = self.navigationController;
    [navController popViewControllerAnimated:NO];

}
-(void) viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.Name.text = self.data[@"Name"];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
