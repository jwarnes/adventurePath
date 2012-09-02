package  
{
	
	/**
	 * ...
	 * @author JWarnes
	 */
	public interface INode 
	{
		function get f():Number;
		function get g():Number;
		function get h():Number;
		function get x():Number;
		function get y():Number;
		function get parentNode():INode;
		function get obstacle():Boolean;
		
		function set f(value:Number):void;
		function set g(value:Number):void;
		function set h(value:Number):void;
		function set x(value:Number):void;
		function set y(value:Number):void;
		function set parentNode(value:INode):void;
		function set obstacle(value:Boolean):void;
		
	}
	
}