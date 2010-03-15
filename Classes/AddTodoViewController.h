//
//  AddTodoViewController.h
//  objective_resource
//
//  Created by James Burka on 1/27/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;
@interface AddTodoViewController : UIViewController <UITextFieldDelegate>  {
	
	IBOutlet UITextField *aTextField;
	Todo *todo;
	UITableViewController *delegate;
	int selection;
	
	
}
@property (readwrite) int selection;
@property (nonatomic,retain) Todo *todo;
@property (nonatomic,retain) UITableViewController *delegate;

@end
