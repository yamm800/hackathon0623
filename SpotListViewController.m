//
//  SpotListViewController.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "SpotListViewController.h"
#import "PlaceManager.h"
#import "defs.h"
#import "Place.h"

@interface SpotListViewController (){
    PlaceManager *placeManager;
    NSArray *places;
}

@end

@implementation SpotListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    placeManager = [PlaceManager sharedManager];
    [placeManager loadFromServer];
    
    NSLog(@"type = %d",self.type);
    
    if(_type == TYPE_CHUKA){
        places = [placeManager chukaItems];
    }
    if(_type == TYPE_VOLGA){
        places = [placeManager volgaItems];
    }
    if(_type == TYPE_OROSI){
        places = [placeManager orosiItems];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Place *place = places[indexPath.row];
    
//name;
//    @property (nonatomic, readonly) NSInteger category;
//    @property (nonatomic, readonly, copy) NSString *guide;
//    @property (nonatomic, readonly, copy) NSString *phone;
//    @property (nonatomic, readonly, copy) NSString *open;
//    @property (nonatomic, readonly, copy) NSString *latitude;
//    @property (nonatomic, readonly, copy) NSString *longtitude;
//    @property (nonatomic, readonly, copy) NSString *access;
//    @property (nonatomic, readonly, copy) NSString *price;
//    @property (nonatomic, readonly, copy) NSString *holiday;
//    @property (nonatomic, readonly, copy) NSString *zipcode;
//    @property (nonatomic, readonly, copy) NSString *address;
    
    
    cell.textLabel.text = place.name;;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
