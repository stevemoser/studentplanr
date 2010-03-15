//
//  AddTodoViewController.m
//  objective_resource
//
//  Created by James Burka on 1/27/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "AddTodoViewController.h"
#import "Todo.h"




@implementation AddTodoViewController
@synthesize todo , delegate, selection;

- (void)viewWillAppear:(BOOL)animated {
	if(todo.todoId) {
		switch (selection) {
			case 0:
				self.title = [NSString stringWithFormat:@"Edit Name",nil];
				break;
			case 1:
				//[self editTodoAttr:indexPath andSelection:0];
				break;
			case 2:
				//[self editTodoAttr:indexPath andSelection:0];
				break;
			case 3:
				self.title = [NSString stringWithFormat:@"Edit Location",nil];
				break;
			case 4:
				self.title = [NSString stringWithFormat:@"Edit Description",nil];
				break;
			default:
				break;
		}
		
	}
	else {
		self.title = @"Add Todo";
	}
	aTextField.returnKeyType = UIReturnKeyDone; 
	[aTextField becomeFirstResponder];
	[super viewWillAppear:animated];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField { 
	[textField resignFirstResponder];
	
	switch (selection) {
		case 0:
			todo.name = textField.text;
			break;
		case 1:
			//[self editTodoAttr:indexPath andSelection:0];
			break;
		case 2:
			//[self editTodoAttr:indexPath andSelection:0];
			break;
		case 3:
			todo.location = textField.text;
			break;
		case 4:
			todo.description = textField.text;
			break;
		default:
			break;
	}
	// If the model is new then create will be called otherwise the model will be updated 
	[todo saveRemote];
	[delegate.tableView reloadData];
	[self.navigationController popViewControllerAnimated:YES];
	return YES; 
} 



- (void)dealloc {
	[super dealloc];
}


@end
