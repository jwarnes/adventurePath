package  
{
	/**
	 * ...
	 * @author JWarnes
	 */
	public class Node implements INode 
	{
		
		//{region Fields & Accesors
		private var _parentNode:INode;		
		private var _f:Number;
		private var _g:Number;
		private var _h:Number;
		private var _x:Number;
		private var _y:Number;
		private var _obstacle:Boolean = true;
		private var connectedNodes:Array;
		private var _id:Number;
		
		public function get ConnectedNodes():Array
		{
			return connectedNodes;
		}
		public function get ID():Number
		{
			return _id;
		}
		public function set ID(value:Number):void
		{
			_id = value;
		}
		//}
		
		public function Node(id:Number = -1) 
		{
			connectedNodes = new Array();
			_id = id;
		}
		
		
		public function addNode(node:Node):void
		{
			this.connectedNodes.push(node);
		}
		
		public static function getConnectedNodes(node:Node):Array
		{
			return node.connectedNodes;
		}
		

		//{region Interface methods
		/* INTERFACE INode */
		
		public function get f():Number 
		{
			return _f;
		}
		
		public function get g():Number 
		{
			return _g;
		}
		
		public function get h():Number 
		{
			return _h;
		}
		
		public function get x():Number 
		{
			return _x;
		}
		
		public function get y():Number 
		{
			return _y;
		}
		
		public function get parentNode():INode 
		{
			return _parentNode;
		}
		
		public function get obstacle():Boolean 
		{
			return _obstacle;
		}
		
		public function set f(value:Number):void 
		{
			_f = value;
		}
		
		public function set g(value:Number):void 
		{
			_g = value;
		}
		
		public function set h(value:Number):void 
		{
			_h = value;
		}
		
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
		public function set parentNode(value:INode):void 
		{
			_parentNode = value;
		}
		
		public function set obstacle(value:Boolean):void 
		{
			_obstacle = value;
		}
		//{ endregion
		
		
		//TODO: removeNode and clearNode methods
		
		
	}

}