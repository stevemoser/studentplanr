//
//  TodosViewController.h
//  objective_resource
//
//  Created by James Burka on 1/26/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TodosViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	NSMutableArray *todos;
	IBOutlet UITableView *tableView;
  IBOutlet UIBarButtonItem * addButton;
}

@property (nonatomic , retain) NSArray* todos;
-(IBAction) refreshButtonWasPressed;
-(IBAction) addButtonWasPressed;
@property(nonatomic , retain) UITableView *tableView;

@end
