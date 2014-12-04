package com.mint;


import flash.display.Sprite;


class M_Screen extends Sprite
{
	private static var instance:M_Screen = new M_Screen();

	public static var screenList:Array<Screen> = new Array();
	private static var world:Sprite;
	
	static public function getInstance(par:Sprite)
	{
		world = par;
		return instance;
		trace("Global Vars Built!");
	}
	
	public static function switchScreen(what:Screen)
	{
		for (i in screenList)
		{
			trace(screenList+" : "+i);
			world.removeChild(i);
			screenList.remove(i);
		}
		
		world.addChild(what);
		screenList.push(what);
	}
	
	public static function addScreen(what)
	{
		
	}
	
	public static function deleteScreen(what)
	{
		
	}
	
	private function new() 
	{
		super();
	}
	
}