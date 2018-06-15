#include "Graph.h"
#include <math.h>

@implementation Edge
- (id) initDestination:(int)d
              andWeight:(int)w
{
  self = [super init];
  if(self)
  {
    [ self setDestination:d ];
    [ self setWeight:w ];
  }
  return self;
}

-(void) setDestination:(int)d
{
  destination = d;
}

-(void) setWeight:(int)w
{
  weight = w;
}

-(int) getDestination
{
  return destination;
}

-(int) getWeight
{
  return weight;
}


@end

@implementation Node
-(id) init
{
  self = [super init];
  if (self )
  {
    adjacentList = [[NSMutableArray alloc] init ];
  }
  return self;
}

-(NSMutableArray*) getAdjacentList
{
  return adjacentList;
}
@end

@implementation Graph
-(id) initSize:(int) sz
      {
      self = [super init];
        if (self)
        {
          size = sz;
          nodeList = [[NSMutableArray alloc] initWithCapacity:sz];
          int i = 0;
          for(i = 0; i < sz; i++)
          {
            Node* n = [[Node alloc] init];
            [nodeList addObject: n];
            n = nil;
          }
        }
        return self;
      }
-(void)   Source:(int)s
          addAdjacent:(int)d
          addWeight:(int)w
          {
            if(d < size || s < size || s >= 0 || d >= 0) {
              Edge *e = [[Edge alloc] initDestination:d andWeight:w];
              //[[nodeList objectAtIndex:s].adjacentList addObject: e];
              Node* n = [nodeList objectAtIndex:s];
              [n->adjacentList addObject: e];
              n = nil;
              e = nil;
              //[nodeList replaceObjectAtIndex:s withObject:n];
            } else {
              NSLog(@"Your node is out of bounds");
            }

          }

-(void) setSize:(int)sz
        {
          size = sz;
          nodeList = [[NSMutableArray alloc] initWithCapacity:sz];
          int i = 0;
          for(i = 0; i < sz; i++)
          {
              [nodeList addObject: [[Node alloc] init]];
          }
        }
-(NSMutableArray*) getList
{
  return nodeList;
}

-(int) getSize
{
  return size;
}

-(int) getMin:(NSMutableArray*) dist
                Set:(NSMutableSet*)Q
{
  NSNumber* min = [NSNumber numberWithFloat:INFINITY];
  int nodeIndex = 0;
  int i = 0;
  for(i = 0; i < [dist count]; i++)
  {
    if([min compare:[dist objectAtIndex:i]] == NSOrderedDescending
        && [Q containsObject:[NSNumber numberWithInt:i]])
        {
          int temp = [[dist objectAtIndex:i] intValue];
          min = [NSNumber numberWithInt:temp];
          nodeIndex = i;
        }
  }

  return nodeIndex;
}

-(NSMutableDictionary*) Djikstra:(int) s
{
  NSMutableSet* Q = [[NSMutableSet alloc] initWithCapacity:size];
  int i = 0;
  int j = 0;
  NSMutableArray* dist = [[NSMutableArray alloc] initWithCapacity:size];
  NSMutableArray* prev = [[NSMutableArray alloc] initWithCapacity:size];
  NSNumber* inf = [NSNumber numberWithFloat:INFINITY];
  NSNumber* undef = [NSNumber numberWithInt:-1];
  NSNumber* zero = [NSNumber numberWithInt:0];
  for(i = 0; i < size; i++)
  {
    [dist addObject:inf];
    [prev addObject:undef];
    [Q addObject: [NSNumber numberWithInt:i]];
  }

  [dist replaceObjectAtIndex:s withObject:zero];
  while( [Q count] > 0)
  {
    int u = [self getMin:dist Set:Q];
    NSNumber* tempU = [NSNumber numberWithInt:u];
    [Q removeObject:tempU];

    NSMutableArray* adjList = [[nodeList objectAtIndex:u] getAdjacentList];
    for(j = 0; j < [adjList count]; j++)
    {
      int length = [[adjList objectAtIndex:j] getWeight];
      int v = [[adjList objectAtIndex:j] getDestination];
      int alt = [[dist objectAtIndex:u] intValue] + length;
        if(alt < [[dist objectAtIndex:v] floatValue])
          {
            NSNumber* tempAlt = [NSNumber numberWithInt:alt];
            [dist replaceObjectAtIndex:v withObject:tempAlt];
            [prev replaceObjectAtIndex:v withObject:tempU];
          }
    }
  }
  NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithCapacity:2];
  [dict setObject:dist forKey:@"dist"];
  [dict setObject:prev forKey:@"prev"];

  return dict;
}
@end
