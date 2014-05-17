//
//  PSUnfinishedBetViewController.m
//  LetsBet
//
//  Created by PlutoShe on 5/14/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import "PSUnfinishedBetViewController.h"
#import "PSUniSwipeCell.h"
#import "PSAddViewController.h"


@interface PSUnfinishedBetViewController () {
  //  NSArray *_sections;
//    NSMutableArray *_testArray;

}

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL useCustomCells;
@property (nonatomic, weak) UIRefreshControl *refreshControl;
@property NSMutableArray* bets;
@property int size;
@property int section;


@end



@implementation PSUnfinishedBetViewController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[PSAddViewController class]])
    {
        PSAddViewController *viewController = segue.destinationViewController;
        
        viewController.callback = ^(NSMutableDictionary *value1) {
            // optionally, close B
            //[self.navigationController popViewControllerAnimated:YES];
            
            // let's do some action after with returned values
//            NSLog(@"%@%@", value1, value2);
//            NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
            
//            [_bets add:cellIndexPath.row];
//            NSDictionary* tmpD = @{@"Name" : @"1234", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"};
            [_bets insertObject: value1 atIndex:0];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
  //          [self.tableView addRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
//            [self.tableView ]
//            [viewController removeFromParentViewController];
        };
        
    }
}

/*
- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // 如果进入的是当前视图控制器
    if (viewController == self) {
        // 背景设置为黑色
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
        // 透明度设置为0.3
        self.navigationController.navigationBar.alpha = 0.300;
        // 设置为半透明
        self.navigationController.navigationBar.translucent = YES;
        self.navigationController.navigationBar.hidden = NO;
    } else {
        // 进入其他视图控制器
        self.navigationController.navigationBar.alpha = 1;
        // 背景颜色设置为系统默认颜色
        self.navigationController.navigationBar.tintColor = nil;
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.hidden = YES;
    }
}*/

-(void) insertObject :(id)sender  {
    
    /*UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"建立新的bet"
                                                        message:@"```"
                                                        delegate:self
                                                        cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
 [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];*/
/*    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"类别修改" message:@" " delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"修改",nil];
     [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];*/
    
 /*   UITextField * txt = [[UITextField alloc] init];
    txt.backgroundColor = [UIColor whiteColor];
    txt.frame = CGRectMake(alert.center.x+65,alert.center.y+48, 150,23);*/
//    [alert addSubview:txt];
   // [alert show];
     [self performSegueWithIdentifier:@"addNewBet" sender:self];
/*    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];*/

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"####";
    self.tabBarController.title = @"@@@@";
    UIBarButtonItem *createBut =[[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStylePlain target:self action:@selector(insertObject:)];

    self.tabBarController.navigationItem.rightBarButtonItem =createBut;
    
    [self.tabBarController.tabBar setBackgroundColor: [UIColor redColor]];//[UIColor colorWithPatternImage:[UIImage imageNamed:@"textile"]]];
    UITabBar *tabBar = self.tabBarController.tabBar;
    for (int i = 0; i < [tabBar.items count]; i++) {
        UITabBarItem *t1 = [tabBar.items objectAtIndex:i];
//        NSLog(@"%@", t1.title);
        t1.title = @"1";
        t1.selectedImage = [UIImage imageNamed:@"textile"];
//        [t1 setBackgroundImage:[UIImage imageNamed:@"textile"]];
//         [t1 setFinishedSelectedImage:[UIImage imageNamed:@"textile"] withFinishedUnselectedImage:[UIImage imageNamed:@"check"]];
       // [t1 initWithTitle:@"!" image:@"textile"];
//        [t1 ]
    }
//    [self.tabBarController.tabBarItem ]
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"textile"] forBarMetrics:UIBarMetricsDefault];
    //    self.navigationItem.leftBarButtonItem = createBut;
//    self.navigationController.navigationBar.translucent = NO;
	
  //  self.navigationItem.title = @"@@@";
//    self.tabBarController.
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selectLeftAction:)];
  //  self.navigationItem.leftBarButtonItem = rightButton;
//    self.navigationItem.hidesBackButton = YES;
//    [self.navigationController pushViewController:self animated:YES];
    
    
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
        self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = YES;

//    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)insertNewObject:(id)sender
{
    NSLog(@"!");
/*    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];*/
}

- (void)viewDidLoad
{
        [super viewDidLoad];

    
//            self.navigationController.navigationBar.opaque = YES;
//    [super viewDidLoad];
 /*   self.cellsCurrentlyEditing = [NSMutableArray array];
    //Create arrays of random background and text colors
    self.backgroundColors = @[[UIColor blueColor],
                              [UIColor greenColor],
                              [UIColor orangeColor],
                              [UIColor darkGrayColor],
                              [UIColor purpleColor],
                              [UIColor lightGrayColor],
                              [UIColor yellowColor]];
    self.textColors = @[[UIColor whiteColor],
                        [UIColor blackColor]];
    
  
 */
    


    
    //MynavigationController = [[UINavigationController alloc]initWithRootViewController:self];
    
    
    
//    [window addSubView:[navigationController view]];
    
  //  MynavigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.hidden = NO;
   // MynavigationController.navigationController.navigationBar.translucent = NO;
  //  NSLog(@"!```!!!");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 90;
    [self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"textile"]]];

    //    self.navigationController.navigationItem.title = @"!!!";
    


//    self.navigationItem.title = @"Pull to Toggle Cell Type";
    
    // Setup refresh control for example app
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(toggleCells:) forControlEvents:UIControlEventValueChanged];
    refreshControl.tintColor = [UIColor blueColor];

    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    
    // If you set the seperator inset on iOS 6 you get a NSInvalidArgumentException...weird
    /*if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // Makes the horizontal row seperator stretch the entire length of the table view
    }*/
//    NSDictionary *wifiData = [[NSDictionary alloc] initWithObjectsAndKeys:bssid,@"bssid",@"jiaxuzhu",@"name",@"1100012981",@"id",@"",@"date",@"",@"time",nil];
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8888/bets"];//162.105.74.252:8888/image1"];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:@"0:b:85:9a:f4:20" forKey:@"bssid"];
    [dictionary setValue:@"id1" forKey:@"name"];
    NSError *error = nil;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:wifiData options:NSJSONWritingPrettyPrinted error:&error];
    
    
  //  NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    //    NSString* postURL = [NSString stringWithData:jsonData encoding:NSUTF8StringEncoding];
    [request setHTTPMethod:@"GET"];//设置请求方式为POST，默认为GET
    NSString *str = @"type=focus-c";//设置参数

    //  [request setHTTPBody:jsonData];
//    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
  //  [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    [conn start];
    
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//    NSMutableArray *results = [str1 JSONValue];
//    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:nil message:str1 delegate:nil cancelButtonTitle:@"OK" otherButto
//    NSLog(@")
    
    //NSData -> NSDictionary
//    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
//    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:received];
  //  NSDictionary *myDictionary = [unarchiver decodeObjectForKey:@"Some Key Value"];
//    [unarchiver finishDecoding];
//     NSError* error1 = nil;
//    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:received options:kNilOptions error: error];


    NSError* error1;
    NSDictionary* dict = [NSJSONSerialization
                          JSONObjectWithData:received
                          
                          options:kNilOptions
                          error:&error1];
    NSLog(@"%@",  [dict objectForKey:@"count"]);
//    NSLog(<#NSString *format, ...#>)
    self.bets = [[NSMutableArray alloc] initWithArray:
                 [dict objectForKey:@"bets"]];
/*                 @[@{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"},
                   @{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"},
                   @{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"},
                   @{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"}
                   ]];*/
    self.size = [self.bets count];
    NSLog(@"%d", _size);
    _section = 1;
   // UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationController.navigationItem
    NSLog(@"+++++++++++");
   // self.navigationItem.

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_bets count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell selected at index path %ld:%ld", (long)indexPath.section, (long)indexPath.row);
    NSLog(@"selected cell index path is %@", [self.tableView indexPathForSelectedRow]);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"UnfinishedBet";
}*/



#pragma mark - UIRefreshControl Selector

- (void)toggleCells:(UIRefreshControl*)refreshControl
{
    [refreshControl beginRefreshing];
    self.useCustomCells = !self.useCustomCells;
    if (self.useCustomCells)
    {
        self.refreshControl.tintColor = [UIColor yellowColor];
    }
    else
    {
        self.refreshControl.tintColor = [UIColor blueColor];
    }
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    NSLog(@"~~~~!!!!!!");
        PSUniSwipeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PSCell" forIndexPath:indexPath];
        
        cell.leftUtilityButtons = [self leftButtons];
        cell.rightUtilityButtons = [self rightButtons];
        cell.delegate = self;
//        [cell setBackgroundColor:[UIColor redColor]];
        NSString *dateObject = _bets[indexPath.row][@"Name"];
    
    NSLog(@"----%@", dateObject);
    cell.debtName.text = _bets[indexPath.row][@"Name"];
    //[NSString stringWithFormat:@"----%@", dateObject];
    cell.firstParty.text = _bets[indexPath.row][@"PartyA"];
    cell.secondParty.text = _bets[indexPath.row][@"PartyB"];
    cell.firstPenalty.text = _bets[indexPath.row][@"PenaltyA"];
    cell.secondPenalty.text = _bets[indexPath.row][@"PenaltyB"];
    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"textile"]]];

        return cell;
   
    
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"More"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"check"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"clock"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"cross"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                icon:[UIImage imageNamed:@"list"]];
    
    return leftUtilityButtons;
}

// Set row height on an individual basis

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return [self rowHeightForIndexPath:indexPath];
//}
//
//- (CGFloat)rowHeightForIndexPath:(NSIndexPath *)indexPath {
//    return ([indexPath row] * 10) + 60;
//}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set background color of cell here if you don't want default white
}

#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"left button 0 was pressed");
            break;
        case 1:
            NSLog(@"left button 1 was pressed");
            break;
        case 2:
            NSLog(@"left button 2 was pressed");
            break;
        case 3:
            NSLog(@"left btton 3 was pressed");
        default:
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
                NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
    NSLog(@"%@ %ld %ld", cellIndexPath, (long)cellIndexPath.row, (long)cellIndexPath.section);
    switch (index) {
        case 0:
        {
            NSLog(@"More button was pressed");
            UIAlertView *alertTest = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"More more more" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles: nil];
            [alertTest show];
            
            [cell hideUtilityButtonsAnimated:YES];
            break;
        }
        case 1:
        {
            // Delete button was pressed
            NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
            
            [_bets removeObjectAtIndex:cellIndexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
//            [self.tableView delete:<#(id)#>]
            break;
        }
        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    return YES;
}

@end
