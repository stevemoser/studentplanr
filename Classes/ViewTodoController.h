//
//  ViewTodoController.h
//  objective_resource
//
//  Created by James Burka on 1/27/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;
@interface ViewTodoController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	
	Todo *todo;
	
}

@property (nonatomic , retain) Todo *todo;

-(void) editTodoAttr:(NSIndexPath *)indexPath andSelection:(int)selection;


@end
