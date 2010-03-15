//
//  TodosViewController.m
//  objective_resource
//
//  Created by James Burka on 1/26/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "TodosViewController.h"
#import "ViewTodoController.h"
#import "Todo.h"
#import "AddTodoViewController.h"

@interface TodosViewController (Private)

- (void) loadTodos;

@end


@implementation TodosViewController
@synthesize todos , tableView;

- (void)viewWillAppear:(BOOL)animated {
	[self loadTodos];
}

- (void) loadTodos {
	self.todos = [Todo findAllRemote];
	[tableView reloadData];
}

-(IBAction) refreshButtonWasPressed {
	[self loadTodos];
}

-(IBAction) addButtonWasPressed {
	AddTodoViewController *aController = [[[AddTodoViewController alloc ] initWithNibName:@"AddTodoView" bundle:nil ] autorelease];
	aController.todo = [[Todo alloc] init];
	aController.delegate = self;
	[self.navigationController pushViewController:aController animated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [todos count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.text = ((Todo *)[todos objectAtIndex:indexPath.row]).name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	ViewTodoController *aController = [[[ViewTodoController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
	aController.todo = (Todo *)[todos objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:aController animated:YES];
}

- (void)tableView:(UITableView *)aTableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath { 
  [aTableView beginUpdates]; 
  if (editingStyle == UITableViewCellEditingStyleDelete) { 
		
    [aTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES]; 
		
    // Deletes the object on the resource
    [(Todo *)[todos objectAtIndex:indexPath.row] destroyRemote];
    [todos removeObjectAtIndex:indexPath.row];
  } 
  [aTableView endUpdates];   
}


- (void)dealloc {
	[todos release];
  [super dealloc];
}


@end

