//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
#import <Foundation/Foundation.h>

// Bridged as `enum PetType: UInt`
typedef NS_ENUM(NSUInteger, BOCPetType) {
    // Swift assumes ObjC enum constants prefixed with enum tag
    BOCPetTypeDog,  // Bridged as `dog`
    BOCPetTypeCat,  // Bridged as `cat`
    BOCPetTypeOther // Bridged as `other`
} NS_SWIFT_NAME(PetType);


// Use `nullable` and `nonnull` qualifiers to specify Optional vs. non-Optional types

NS_SWIFT_NAME(Toy)
@interface BOCToy : NSObject
// Bridged as `init(name: String?)`
- (nonnull instancetype)initWithName:(nullable NSString *)name;
+ (nonnull instancetype)toyWithName:(nullable NSString *)name;

// Bridged as `var name: String`
@property (strong, nonatomic, nonnull) NSString *name;
@end


NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Pet)
@interface BOCPet : NSObject

// Bridged as `init(name: String?, type: PetType)`
- (instancetype)initWithName:(nullable NSString *)name type:(BOCPetType)petType;
+ (instancetype)petWithName:(nullable NSString *)name type:(BOCPetType)petType;

// Bridged as `var type: PetType`
@property (nonatomic) BOCPetType petType NS_SWIFT_NAME(type);

// Bridged as `var name: String`
@property (strong, nonatomic) NSString *name;

// Bridged as `var toys: [Toy]`
// Note: non-parameterized arrays are bridged as `[Any]`
@property (strong, nonatomic) NSArray<BOCToy *> *toys;

@end
NS_ASSUME_NONNULL_END




