//
//  PSAddViewController.m
//  LetsBet
//
//  Created by PlutoShe on 5/16/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import "PSAddViewController.h"
#import "LTView.h"
@interface PSAddViewController ()
@property int size;

@end

@implementation PSAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.view cache:YES];

    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = YES;
    
    //    [self.navigationController setNavigationBarHidden:YES animated:animated];
}



-(void)createObject:(id)sender{
    LTView *tmpView = (LTView *)[self.view viewWithTag:100];
    if (self.callback) {
        self.callback(tmpView.text, tmpView.text);
    }
            [self.view removeFromSuperview];
}

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    self.navigationItem.title = @"BetCreate";
    //    self.navigationItem
    UIBarButtonItem *createBut =[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(createObject:)];
    
    //    self.tabBarController.navigationItem.rightBarButtonItem =createBut;
    
    self.navigationItem.rightBarButtonItem = createBut;
    NSArray *labelNames=@[@"事务",@"甲方",@"乙方",@"甲方惩罚",@"乙方惩罚"];
    NSArray *placeHolders=@[@"请输入事务",@"请输入甲方",@"请输入乙方",@"请输入惩罚措施",@"请输入惩罚措施"];
    CGFloat y=50;
    _size = [labelNames count] + 99;
    for (int i=0; i<[labelNames count]; i++) {
        
        LTView *ltview=[[LTView alloc]initWithFrame:CGRectMake(10, y, 280, 30) labelText:[labelNames objectAtIndex:i] placeholder:[placeHolders objectAtIndex:i] spacing:0];
        ltview.delegate=self;
        ltview.tag = 100+i;//设置ltview的tag值，通过tag值取得ltview上的textField
#pragma mark ---根据tag值并判断tag值，设置对应文本框键盘的Return键
        if (ltview.tag!=_size) {
            ltview.textField.returnKeyType=UIReturnKeyNext;
        }
        else{
            ltview.textField.returnKeyType=UIReturnKeyDone;
        }
        //设置下边的代码后，上边的效果就没了
        /*
         #pragma mark ---根据tag值并判断tag值，设置对应文本框键盘的类型
         if (ltview.tag==100) {
         ltview.textField.keyboardType=UIKeyboardTypeDefault;
         }else{
         ltview.textField.keyboardType=UIKeyboardTypePhonePad;
         }
         */

//        [window addSubview:ltview];
        [self.view addSubview: ltview];

//        [s]
        //[ltview release];
        
        y+=50;
        
    }
    

	// Do any additional setup after loading the view.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.superview.tag != _size)
    {
        LTView *nextView = (LTView *)[self.view viewWithTag:textField.superview.tag+1];
        [nextView.textField becomeFirstResponder];
    }else{
        [textField setReturnKeyType:UIReturnKeyDone];
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
