#include "Graph.h"
#include <Foundation/Foundation.h>

int main()
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Graph* g = [[Graph alloc] initSize:5];
    [g Source:0 addAdjacent:1 addWeight:6];
    [g Source:0 addAdjacent:3 addWeight:1];
    [g Source:1 addAdjacent:0 addWeight:6];
    [g Source:1 addAdjacent:3 addWeight:2];
    [g Source:1 addAdjacent:4 addWeight:2];
    [g Source:1 addAdjacent:2 addWeight:5];
    [g Source:2 addAdjacent:1 addWeight:5];
    [g Source:2 addAdjacent:4 addWeight:5];
    [g Source:4 addAdjacent:3 addWeight:1];
    [g Source:4 addAdjacent:1 addWeight:2];
    [g Source:4 addAdjacent:2 addWeight:5];
    [g Source:3 addAdjacent:0 addWeight:1];
    [g Source:3 addAdjacent:1 addWeight:2];
    [g Source:3 addAdjacent:4 addWeight:1];

    NSMutableDictionary* dict = [g Djikstra: 0];

    int j = 0;
    for(j = 0; j < [[dict objectForKey:@"dist"] count]; j++)
    {
        int testD = [[[dict objectForKey:@"dist"] objectAtIndex:j] intValue];
        NSLog(@"Shortest distance to node %d: %d",j,testD);
    }

    for(j = 0; j < [[dict objectForKey:@"dist"] count]; j++)
    {
        int testP = [[[dict objectForKey:@"prev"] objectAtIndex:j] intValue];
        NSLog(@"Previous shortest node: %d from node: %d",testP,j);
    }




    //Tests if Graph Class Works
    // NSMutableArray* list = [g getList];
    // NSMutableArray* adj = [[list objectAtIndex:4] getAdjacentList];
    // int i = 0;
    // for(i = 0; i< [adj count];i++) {
    //   int d = [[adj objectAtIndex:i] getDestination];
    //   int w = [[adj objectAtIndex:i] getWeight];
    //   NSLog(@"Destination:%d Weight:%d",d,w);
    // }

    [pool drain];


  return 0;
}
