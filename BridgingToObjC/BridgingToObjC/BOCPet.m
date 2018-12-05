//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

#import "BOCPet.h"


@implementation BOCToy
- (instancetype)initWithName:(NSString *)name {
    if (!(self = [super init])) return nil;
    self.name = [name copy];
    return self;
}

+ (instancetype)toyWithName:(NSString *)name {
    return [[[self class] alloc] initWithName:name];
}

- (NSString *)description {
    return self.name;
}
@end


@implementation BOCPet

+ (NSArray *)dogToys
{
    return @[[BOCToy toyWithName:@"ball"], [BOCToy toyWithName:@"rope"]];
}

+ (NSArray *)catToys
{
    return @[[BOCToy toyWithName:@"yarn"], [BOCToy toyWithName:@"mousie"]];
}

- (instancetype)initWithName:(NSString *)name type:(BOCPetType)type
{
    if (!(self = [super init])) return nil;
    
    self.name = [name copy];
    self.petType = type;
    
    self.toys = type == BOCPetTypeDog ? [self.class dogToys] : [self.class catToys];
    
    return self;
}

+ (instancetype)petWithName:(NSString *)name type:(BOCPetType)type
{
    return [[self.class alloc] initWithName:name type:type];
}

@end
