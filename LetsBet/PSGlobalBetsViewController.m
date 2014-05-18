//
//  PSGlobalBetsViewController.m
//  LetsBet
//
//  Created by PlutoShe on 5/14/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import "PSGlobalBetsViewController.h"
#import "PSGloSwipeCell.h"
#import "PSDetailViewController.h"



@interface PSGlobalBetsViewController () {
    //  NSArray *_sections;
    //    NSMutableArray *_testArray;
    
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL useCustomCells;
@property (nonatomic, weak) UIRefreshControl *refreshControl;
@property NSMutableArray* bets;
@property int size;
@property int section;
@property int selectRow;

@end



@implementation PSGlobalBetsViewController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[PSDetailViewController class]])
    {
        PSDetailViewController *viewController = segue.destinationViewController;
        viewController.row = _selectRow;
        viewController.data = _bets[_selectRow];
        viewController.callback = ^(int value1) {
            //[_bets insertObject: value1 atIndex:0];
            [_bets removeObjectAtIndex:value1];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:value1 inSection:0];
//            [self.tableView rem:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        };
        
    }

}



- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
 }



- (void)insertNewObject:(id)sender
{
    NSLog(@"!");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 90;
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(toggleCells:) forControlEvents:UIControlEventValueChanged];
    refreshControl.tintColor = [UIColor blueColor];
    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    
    
    /*  NSURL *url = [NSURL URLWithString:@"http://162.105.74.252:8888/mybets"];//162.105.74.252:8888/image1"];
     NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
     [request setHTTPMethod:@"GET"];//设置请求方式为POST，默认为GET
     NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
     [conn start];
     
     
     NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
     
     
     NSError* error1;
     NSDictionary* dict = [NSJSONSerialization
     JSONObjectWithData:received
     
     options:kNilOptions
     error:&error1];
     NSLog(@"%@",  [dict objectForKey:@"count"]);
     self.bets = [[NSMutableArray alloc] initWithArray:
     [dict objectForKey:@"bets"]];*/
    self.bets = [[NSMutableArray alloc] initWithArray:@[@{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"},
                                                        @{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"},
                                                        @{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"},
                                                        @{@"Name" : @"h1", @"PartyA" : @"W1", @"PartyB" : @"W2", @"PenaltyA":@"d1", @"PenaltyB":@"d2"}
                                                        ]];
    
    
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
    _selectRow = indexPath.row;
    [self performSegueWithIdentifier:@"detail" sender:self];
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
    cell.debtName.text = [[NSString alloc] initWithFormat:@"Name : %@",  _bets[indexPath.row][@"Name"]];
    //[NSString stringWithFormat:@"----%@", dateObject];
/*    cell.firstParty.text = [[NSString alloc] initWithFormat:@"PartyA : %@",  _bets[indexPath.row][@"PartyA"]];
    cell.secondParty.text = [[NSString alloc] initWithFormat:@"PartyB : %@",  _bets[indexPath.row][@"PartyB"]];
    cell.firstPenalty.text = [[NSString alloc] initWithFormat:@"PenaltyA : %@",  _bets[indexPath.row][@"PenaltyA"]];
    cell.secondPenalty.text =[[NSString alloc] initWithFormat:@"PenaltyB : %@",  _bets[indexPath.row][@"PenaltyB"]];*/
    //[cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"textile"]]];
    
    return cell;
    
    
}

- (NSArray *)rightButtons
{
    
    
    return nil;
}

- (NSArray *)leftButtons
{
    
    return nil;
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
