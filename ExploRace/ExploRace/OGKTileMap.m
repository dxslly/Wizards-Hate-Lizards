//
//  OGKTileMap.m
//  ExploRace
//
//  Created by David Samuelson on 1/30/14.
//  Copyright (c) 2014 OGK. All rights reserved.
//

#import "OGKTileMap.h"
#import "OGKTile.h"

@interface OGKTileMap ()

@property NSMutableDictionary *tiles;

@end

@implementation OGKTileMap

// Accepts a CVS string of names that correspond to their image names (eg: mountain)
- (instancetype)initWithString:(NSString *)string WithWidth:(int)width
{
    if (self = [super init])
    {
        NSArray *tileStrings = [string componentsSeparatedByString:@","];
        _widthInTiles = width;
        _heightInTiles = tileStrings.count / width;
        self.tiles = [[NSMutableDictionary alloc] initWithCapacity:_count];
        for (int x = 0; x < self.widthInTiles; x++) {
            for (int y = 0; y < self.heightInTiles; y++) {
                OGKTile *tile = [[OGKTile alloc] initWithName:tileStrings[x * self.widthInTiles + y] X:x Y:y];
                tile.name = tileStrings[x * _widthInTiles + y];
                [self.tiles setObject: tile
                               forKey:[NSString stringWithFormat:@"X%dY%d", x, y]];
            }
        }
    }
    return self;
}

- (OGKTile *)getTileAtX:(int)x Y:(int)y
{
    if ([self checkTileExistAtX:x Y:y])
    {
        NSString *key = [NSString stringWithFormat:@"X%dY%d", x, y];
        return self.tiles[key];
    }
    else
        return nil;
}

- (BOOL)checkTileExistAtX:(int)x Y:(int)y
{
    return x >= 0 && x < self.widthInTiles && y >= 0 && y < self.heightInTiles;
}


@end
