package 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author jwarnes
	 */
	public class PlayState extends FlxState 
	{
		//testing variables
		private var n1:Node = new Node(1);
		private var n2:Node = new Node(2);
		private var n3:Node = new Node(3);
		private var n4:Node = new Node(4);
		private var n5:Node = new Node(5);
		
		private var debug:FlxText = new FlxText(0, FlxG.height - 30, FlxG.width, 'adventurePath').setFormat(null, 8, 0xffffff, 'center');
	
		public function PlayState():void 
		{
		}
		
		override public function create():void
		{
			var player:FlxSprite = new FlxSprite();
			player.createGraphic(30, 30, 0xff0000);
			add(player);
			add(debug);
			
			demoNodes();
			
			var path:Array = Pathfinder.findPath(n1, n5, Node.getConnectedNodes);
			debug.text = "Nodes:";
			for (var i:Number = 0; i < path.length; i++)
			{
				debug.text += " " + path[i].ID.toString() + ",";
			}
			debug.text = debug.text.substr(0, debug.text.length - 1);
			

		}
		
		private function demoNodes():void {
			//setup demo node connections
			n1.addNode(n2);
			n1.addNode(n3);
			
			n2.addNode(n1);
			
			n3.addNode(n1);
			n3.addNode(n4);
			n3.addNode(n5);
			
			n4.addNode(n3);
			n5.addNode(n3);
			
			//node positions
			n1.x = 50;
			n1.y = 100;
			n2.x = 115;
			n2.y = 170;
			n3.x = 140;
			n3.y = 85;
			n4.x = 220;
			n4.y = 45;
			n5.x = 235;
			n5.y = 140;
			
			addNodeSprite(n1);
			addNodeSprite(n2);
			addNodeSprite(n3);
			addNodeSprite(n4);
			addNodeSprite(n5);
		}
		
		private function addNodeSprite(node:Node):void {
			var sprite:FlxSprite = new FlxSprite(node.x, node.y);
			add(sprite);
		}
	}
	
}