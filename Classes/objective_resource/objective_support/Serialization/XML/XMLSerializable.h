//
//  XMLSerializable.h
//  
//
//  Created by Ryan Daigle on 7/31/08.
//  Copyright 2008 yFactorial, LLC. All rights reserved.
//

@protocol XMLSerializable

/**
 * Instantiate a single instance of this class from the given XML data.
 */
+ (id)fromXMLData:(NSData *)data;

/**
 * Instantiate a collectionof instances of this class from the given XML data.
 */
+ (NSArray *)allFromXMLData:(NSData *)data;

/**
 * Get the full XML representation of this object (minus the xml directive)
 * using the default element name:
 *
 *   [myTodo toXMLElement] //> @"<todo><first_name>Ryan</first_name>...</todo>"
 */
- (NSString *)toXMLElement;


/**
 * Gets the full representation of this object minus the elements in the exclusions array
 *
 *
 *
 */
- (NSString *)toXMLElementExcluding:(NSArray *)exclusions;

/**
 * Get the full XML representation of this object (minus the xml directive)
 * using the given element name:
 *
 *   [myTodo toXMLElementAs:@"human"] //> @"<human><first_name>Ryan</first_name>...</human>"
 */
- (NSString *)toXMLElementAs:(NSString *)rootName;

/**
 * Get the full XML representation of this object (minus the xml directive)
 * using the given element name and excluding the given properties.
 *
 *  [myTodo toXMLElementAs:@"human" excludingInArray:[NSArray arrayWithObjects:@"firstName", nil]]
 *
 *  //> @"<human><last-name>Daigle</last-name></human>
 */
- (NSString *)toXMLElementAs:(NSString *)rootName excludingInArray:(NSArray *)exclusions;

/**
 * Get the full XML representation of this object (minus the xml directive)
 * using the given element name and translating property names with the keyTranslations mapping.
 *
 *  [myTodo toXMLElementAs:@"human" withTranslations:[NSDictionary dictionaryWithObjectsAndKeys:@"lastName", @"surname", nil]]
 *
 *  //> @"<human><first-name>Ryan</first-name><surname>Daigle</surname></human>
 */
- (NSString *)toXMLElementAs:(NSString *)rootName withTranslations:(NSDictionary *)keyTranslations;

/**
 * Get the full XML representation of this object (minus the xml directive)
 * using the given element name, excluding the given properties, and translating
 * property names with the keyTranslations mapping.
 *
 *  [myTodo toXMLElementAs:@"human" excludingInArray:[NSArray arrayWithObjects:@"firstName", nil]
 *			withTranslations:[NSDictionary dictionaryWithObjectsAndKeys:@"lastName", @"surname", nil]]
 *
 *  //> @"<human><surname>Daigle</surname></human>
 */
- (NSString *)toXMLElementAs:(NSString *)rootName excludingInArray:(NSArray *)exclusions
			withTranslations:(NSDictionary *)keyTranslations;

@end