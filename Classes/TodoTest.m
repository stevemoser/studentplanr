//
//  TodoTest.m
//  objective_resource
//
//  Created by James Burka on 1/27/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "TodoTest.h"
#import "Todo.h"


@implementation TodoTest

-(void) setUp {
	[ObjectiveResourceConfig setSite:@"http://studentplanr.heroku.com/"];
	//[ObjectiveResourceConfig setResponseType:JSONResponse];
	[ObjectiveResourceConfig setUser:@"iphoneTest"];
	[ObjectiveResourceConfig setPassword:@"phone"];
	[ObjectiveResourceConfig setResponseType:XmlResponse];
}

-(void) testA_TodoCreate {
	BOOL found = NO;
	Todo *toCreate = [[Todo alloc] init];
	toCreate.name = @"Todo New";
	STAssertTrue(	[toCreate createRemote], @"Should have been true");	
	NSArray *todos = [Todo findAllRemote];
	
	for(Todo *todo in todos) {
		if([toCreate isEqualToRemote:todo]) {
			found = YES;
		}
	}
	STAssertTrue(found, @"Did not find the new todo : %@",toCreate.name);	
}

-(void) testB_TodoUpdate {
	BOOL found = NO;
	NSArray *todos = [Todo findAllRemote];
	Todo *toUpdate = [todos lastObject];
	toUpdate.name = @"Todo Update";
	STAssertTrue(	[toUpdate saveRemote], @"Should have been true");	
	todos = [Todo findAllRemote];
	for(Todo *todo in todos) {
		if([toUpdate isEqualToRemote:todo] && [toUpdate.name isEqualToString:todo.name]) {
			found = YES;
		}
	}
	STAssertTrue(found, @"");	
}

-(void) testC_FindTodo {
	NSArray * todos = [Todo findAllRemote];
	Todo *toFind = (Todo *)[todos lastObject];
	STAssertTrue([toFind isEqualToRemote:[Todo findRemote:toFind.todoId]], @"Should of returned %@",toFind.name);	
}

-(void) testD_TodoDelete {
	int count = [[Todo findAllRemote]count];
	NSArray *todos = [Todo findAllRemote];
	Todo *todo = [todos lastObject];
	//int modelId = [todo todoId];
	STAssertTrue([todo destroyRemote], @"Should have been true");	
	todos = [Todo findAllRemote];
	
	STAssertTrue((count-1) == [todos count], @"Should have %i todos , %d found" ,count-1 ,[todos count]);
	
}



@end
