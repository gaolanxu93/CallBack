//
//  APIHandle.m
//  CallBack
//
//  Created by LiBinggen on 15/9/7.
//  Copyright (c) 2015年 qingqing. All rights reserved.
//

#import "APIHandle.h"

@implementation APIHandle

- (void)loadData
{
    self.receiveData = [[NSMutableData alloc]init];
    NSDictionary *paramSource = [self.paramSourceHandle paramSourceAPIHandle:self];
    NSURL *url = [[NSURL alloc]initWithString:paramSource[@"URLString"]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error = nil;
    id data = [NSJSONSerialization JSONObjectWithData:self.receiveData options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"%@ data\n%@",self,data);
    
    [self.callbackHandle listWtihData:data apiHandle:self];
}
@end
