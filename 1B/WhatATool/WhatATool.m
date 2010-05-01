#import <Foundation/Foundation.h>

void PrintPathInfo() {
    NSString* home = [@"~" stringByExpandingTildeInPath];
    NSLog(@"My home folder is at '%@'", home);
    for(NSString* pathComponent in [home pathComponents]) {
        NSLog(@"%@", pathComponent);
    }
}

void PrintProcessInfo() {
    NSProcessInfo* processInfo = [NSProcessInfo processInfo];
    NSLog(@"Process Name: '%@' Process ID: '%i'", 
          [processInfo processName], 
          [processInfo processIdentifier]);
}

void PrintBookmarkInfo() {
    NSMutableDictionary* bookmarks = [NSMutableDictionary dictionary];
    [bookmarks setObject: [NSURL URLWithString:@"http://www.stanford.edu"] forKey: @"Stanford University"];
    [bookmarks setObject: [NSURL URLWithString:@"http://www.apple.com"] forKey: @"Apple"];
    [bookmarks setObject: [NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey: @"CS193P"];
    [bookmarks setObject: [NSURL URLWithString:@"http://itunes.stanford.edu"] forKey: @"Stanford on iTunes U"];
    [bookmarks setObject: [NSURL URLWithString:@"http://stanfordshop.com"] forKey: @"Stanford Mall"];
    for (NSString* key in bookmarks) {
        if ([key hasPrefix:@"Stanford"]) {
             NSLog(@"Key: %@, URL: %@", key, [bookmarks objectForKey:key]);
        }
    }
}

void LogHeader(NSString* text) {
    NSLog(@"=========%@===========", text);
}

NSString* BoolString(BOOL value) {
    return value? @"YES" : @"NO";
}

void PrintIntrospectionInfo() {
    NSMutableArray* objects = [NSMutableArray array];
    [objects addObject: @"Hello"];
    [objects addObject: [NSDictionary dictionaryWithObjectsAndKeys:@"asdf", @"foo", nil]];
    [objects addObject: [NSProcessInfo processInfo]];
    [objects addObject: [NSArray class]];
    [objects addObject: objects];
    for(id object in objects) {
        SEL lowercaseString = @selector(lowercaseString);
        BOOL respondsToLowercaseString = [object respondsToSelector:lowercaseString];
        NSLog(@"Class name: %@", [object class]);
        NSLog(@"Is Member of NSString: %@", BoolString([object isMemberOfClass: [NSString class]]));
        NSLog(@"Is Kind of NSString: %@", BoolString([object isKindOfClass: [NSString class]]));
        NSLog(@"Responds to lowercaseString: %@", BoolString(respondsToLowercaseString));
        if (respondsToLowercaseString) {
            NSLog(@"lowercaseString is: %@", [object performSelector:lowercaseString]);
        }
        NSLog(@"---");
    }
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    LogHeader(@"Path Info");
    PrintPathInfo();
    
    LogHeader(@"Process Info");
    PrintProcessInfo();
    
    LogHeader(@"Bookmark Info");
    PrintBookmarkInfo();
    
    LogHeader(@"Introspection Info");
    PrintIntrospectionInfo();
    
    [pool drain];
    return 0;
}
