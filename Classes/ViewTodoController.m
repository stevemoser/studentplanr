//
//  ViewTodoController.m
//  objective_resource
//
//  Created by James Burka on 1/27/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "ViewTodoController.h"
#import "AddTodoViewController.h"
#import "Todo.h"

@implementation ViewTodoController
@synthesize todo;


- (void)viewDidLoad {
	//self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit 
	//																					   target:self action:@selector(editTodoButtonWasPressed)]; 
}

- (void)viewWillAppear:(BOOL)animated {
	self.title = todo.name;
	[super viewWillAppear:animated];
}


-(void) editTodoAttr:(NSIndexPath *)indexPath 
		andSelection:(int)selection {
	AddTodoViewController *aController = [[[AddTodoViewController alloc ] initWithNibName:@"AddTodoView" bundle:nil ] autorelease];
	aController.todo = todo;
	aController.delegate = self;
	aController.selection = selection;
	[self.navigationController pushViewController:aController animated:YES];	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Todo";
	
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]  autorelease];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
	switch (indexPath.section) {
		case 0:
			cell.text = todo.name;
			break;
		case 1:
			cell.text = @"mock start"; //todo.starttime;
			break;
		case 2:
			cell.text = @"mock end"; ///todo.endtime;
			break;
		case 3:
			cell.text = todo.location;
			break;
		case 4:
			cell.text = todo.description;
			break;
		default:
			break;
	}
	// Configure the cell
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  	return [[NSArray arrayWithObjects:@"Todo's Name",@"Start Time",@"End Time",@"Location",@"Description",nil] 
			objectAtIndex:section];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return indexPath;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	switch (indexPath.section) {
		case 0:
			[self editTodoAttr:indexPath andSelection:0];
			break;
		case 1:
			//[self editTodoAttr:indexPath andSelection:0];
			break;
		case 2:
			//[self editTodoAttr:indexPath andSelection:0];
			break;
		case 3:
			[self editTodoAttr:indexPath andSelection:3];
			break;
		case 4:
			[self editTodoAttr:indexPath andSelection:4];
			break;
		default:
			break;
	}
	// if(indexPath.section == 2) {
	// aController.owner = todo;
	// [self.navigationController pushViewController:aController animated:YES];		
	// }
	
}



- (void)dealloc {
    [super dealloc];
}


@end

