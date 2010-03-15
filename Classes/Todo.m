//
//  Todo.m
//  objective_resource
//
//  Created by James Burka on 1/26/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "Todo.h"
#import "ObjectiveResource.h"

@implementation Todo 
@synthesize createdAt , updatedAt , name, location, calendar, description, todoId;


// handle pluralization 
+ (NSString *)getRemoteCollectionName {
	return @"todos";
}



- (void) dealloc
{
	[location release];
	[calendar release];
	[description release];
  [createdAt release];
  [updatedAt release];
	[name release];
	[todoId release];
	[super dealloc];
}

@end
