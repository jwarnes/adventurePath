package  
{
	/**
	 * ...
	 * @author JWarnes
	 */
	public class Pathfinder 
	{
		
		public function Pathfinder() 
		{
		}
		
		public static var heuristic:Function = Pathfinder.diagonalHeuristic;
		
		public static function findPath(firstNode:INode, destinationNode:INode, connectedNodeFunction:Function):Array 
		{
			//setup our variables
			var openNodes:Array = [];
			var closedNodes:Array = [];
			var currentNode:INode = firstNode;
			var testNode:INode;
			var connectedNodes:Array;
			var travelCost:Number = 1.0;
			
			var g:Number;
			var h:Number;
			var f:Number;
			currentNode.g = 0;
			currentNode.h = Pathfinder.heuristic(currentNode, destinationNode, travelCost);
			currentNode.f = currentNode.g + currentNode.h;
			var l:int;
			var i:int;
			
			//main pathfinding loop
			while (currentNode != destinationNode) 
			{
				connectedNodes = connectedNodeFunction( currentNode );
				l = connectedNodes.length;
				for (i = 0; i < l; ++i) {
					testNode = connectedNodes[i];
					if (testNode == currentNode || testNode.obstacle == false) continue;
					g = currentNode.g  + travelCost;
					h = heuristic( testNode, destinationNode, travelCost);
					f = g + h;
					if ( Pathfinder.isOpen(testNode, openNodes) || Pathfinder.isClosed( testNode, closedNodes) )	{
						if(testNode.f > f)
						{
			 
							testNode.f = f;
							testNode.g = g;
							testNode.h = h;
							testNode.parentNode = currentNode;
						}
					}else {
						testNode.f = f;
						testNode.g = g;
						testNode.h = h;
						testNode.parentNode = currentNode;
						openNodes.push(testNode);
					}
				}
				closedNodes.push( currentNode );
				if (openNodes.length == 0) {
					return null;
				}
				openNodes.sortOn('f', Array.NUMERIC);
				currentNode = openNodes.shift() as INode;
			}
			
			return Pathfinder.buildPath(destinationNode, firstNode);
		}
		
		public static function buildPath(destinationNode:INode, startNode:INode):Array {
			var path:Array = [];
			var node:INode = destinationNode;
			path.push(node);
			while (node != startNode) {
				node = node.parentNode;
				path.unshift( node );
			}
			return path;
		}
		
		public static function isOpen(node:INode, openNodes:Array):Boolean {
			
			var l:int = openNodes.length;
			for (var i:int = 0; i < l; ++i) {
				if ( openNodes[i] == node ) return true;
			}
			
			return false;			
		}
		
		public static function isClosed(node:INode, closedNodes:Array):Boolean {
			
			var l:int = closedNodes.length;
			for (var i:int = 0; i < l; ++i) {
				if (closedNodes[i] == node ) return true;
			}
			
			return false;
		}
		
		
		//our heuristics 
		public static function diagonalHeuristic(node:INode, destinationNode:INode, cost:Number = 1.0, diagonalCost:Number = 1.0):Number
		{
			var dx:Number = Math.abs(node.x - destinationNode.x);
			var dy:Number = Math.abs(node.y - destinationNode.y);
			var diag:Number = Math.min(dx, dy);
			var straight:Number = dx + dy;
			
			return diagonalCost * diag + cost * (straight - 2 * diag);
		}
		
		public static function euclidianHeuristic(node:INode, destinationNode:INode, cost:Number = 1.0):Number 
		{
			var dx:Number = node.x - destinationNode.x;
			var dy:Number = node.y - destinationNode.y;
			
			return Math.sqrt( dx * dx + dy * dy ) * cost;
		}
		
	}

}

















