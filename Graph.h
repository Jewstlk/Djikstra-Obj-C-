#import <Foundation/Foundation.h>

@interface Edge : NSObject
{
  int destination;
  int weight;
}

-(id) initDestination:(int)d
            andWeight:(int)w;

-(void) setDestination:(int)d;
-(void) setWeight:(int)w;
-(int) getDestination;
-(int) getWeight;
@end

@interface Node : Edge
{
  NSMutableArray* adjacentList;
}
-(NSMutableArray*) getAdjacentList;
@end

@interface Graph : Node
{
  NSMutableArray* nodeList;
  int size;
}

-(id) initSize:(int) sz;

-(void) Source:(int)s
        addAdjacent:(int)d
        addWeight:(int)w;

-(void) setSize:(int)sz;
-(NSMutableArray*) getList;
-(int) getSize;
-(int) getMin:(NSMutableArray*)dist
              Set:(NSMutableSet*)Q;
-(NSMutableDictionary* ) Djikstra:(int) s;
@end
