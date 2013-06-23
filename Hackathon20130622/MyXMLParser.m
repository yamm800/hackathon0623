//
//  MyXMLParser.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/22.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "MyXMLParser.h"

#define ID          @"id"
#define SPOT_NAME   @"spot_name"
#define TAGS        @"tags"
#define AREA_TAG    @"area_tag"
#define PHOTO_URL   @"photo_url%d"
#define MOVIE_URL   @"movie_url%d"
#define LATITUDE    @"latitude"
#define LONGITUDE   @"longitude"
#define GOOGLEMAP   @"googlemap"
#define ZIPCODE     @"zipcode"
#define ADDRESS     @"address"
#define TEL         @"tel"
#define MAIL        @"mail"
#define WEBSITE     @"website"
#define HOLIDAY     @"holiday"
#define PARKING     @"parking"
#define SEAT        @"seat"
#define PRICE       @"price"
#define ACCESS      @"access"
#define CREATED     @"created"
#define EXPLANATION @"explanation"

@implementation MyXMLParser{
    BOOL            _inLatitude;
    BOOL            _inLongitude;
    NSInteger       _type;
    NSMutableArray  *_spots;
}

// 引数なしのイニシャライザの実装
- (id)init {
    self = [super init];
    if (self != nil) {
        _inLatitude = NO;
        _inLongitude = NO;
    }
    return self;
}

- (id)initWithType:(NSInteger)type{
    self = [self init];
    if (self != nil) {
        _type = type;
    }
    return self;
}

- (void)loadingXML:(NSString*)urlString{
    NSXMLParser* parser = [[NSXMLParser alloc] initWithContentsOfURL:
                           [NSURL URLWithString:urlString]];
	parser.delegate = self;
	[parser parse];
}

#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict {
    //    NSLog(@"elementname = %@", elementName);
    //    NSLog(@"namespaceURI = %@", namespaceURI);
    //    NSLog(@"qName = %@", qName);
    //    NSLog(@"attributeDict = %@", attributeDict);
    
    if([elementName isEqualToString:LATITUDE]){
        _inLatitude = YES;
    }
    if([elementName isEqualToString:LONGITUDE]){
        _inLongitude = YES;
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    if([elementName isEqualToString:LATITUDE]){
        _inLatitude = NO;
    }
    if([elementName isEqualToString:LONGITUDE]){
        _inLongitude = NO;
    }
    
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    if(_inLatitude){
        NSLog(@"string = %@", string);
    }
    if(_inLongitude){
        NSLog(@"string = %@", string);
    }
    
}

- (void)parser:(NSXMLParser *)parser
parseErrorOccurred:(NSError *)parseError {
    
}

@end
