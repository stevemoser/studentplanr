//
//  EditTodoController.h
//  objective_resource
//
//  Created by James Burka on 1/27/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo , ViewTodoController;
@interface EditTodoController : UIViewController {

  Todo * todo;
  IBOutlet UITextField * aTextField;
  ViewTodoController * aViewController;
  
}

@property (nonatomic , retain) Todo * todo;
@property (nonatomic , retain) UITextField * aTextField;
@property (nonatomic , retain) ViewTodoController * aViewController;

@end
