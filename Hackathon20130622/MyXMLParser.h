//
//  MyXMLParser.h
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/22.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyXMLParser : NSObject<NSXMLParserDelegate>

- (id)initWithType:(NSInteger)type;
- (void)loadingXML:(NSString*)urlString;

@end
