//
//  Todo.h
//  objective_resource
//
//  Created by James Burka on 1/26/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "ObjectiveResource.h"

@interface Todo : NSObject {
	
	NSString *name;
	//NSString *starttime;
	//NSString *endtime;
	NSString *location;
	NSString *calendar;
	NSString *description;
  NSString *todoId;
  NSDate   *updatedAt;
  NSDate   *createdAt;
  
}

@property (nonatomic , retain) NSDate * createdAt;
@property (nonatomic , retain) NSDate * updatedAt;
@property (nonatomic , retain) NSString  *todoId;
@property (nonatomic , retain) NSString *name;
//@property (nonatomic , retain) NSString *starttime;
//@property (nonatomic , retain) NSString *endtime;
@property (nonatomic , retain) NSString *location;
@property (nonatomic , retain) NSString *calendar;
@property (nonatomic , retain) NSString *description;


@end
