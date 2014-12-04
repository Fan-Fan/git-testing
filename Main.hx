package;


import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.Lib;
import flash.display.StageScaleMode;
//import openfl.Assets;
import openfl.display.FPS;


import com.mint.C_Xbox;
import com.mint.M_Marionette;
import com.mint.C_Keyboard;

class Main extends Sprite
{
	private var speed:Float = 4.0;
	private var Box:Sprite;
	private var i:Int;
	private var u:Bool;
	private var x:C_Keyboard;
	private var git:String;

	public function new ()
	{
		super ();

		//Lib.current.stage.scaleMode = StageScaleMode.SHOW_ALL;

		addEventListener(Event.ADDED_TO_STAGE,init);
	}

	public function init(e:Event)
	{
		/*
		M_Marionette.getInstance();
		*/
		

		#if flash
			var chara:MovieClip = flash.Lib.attach("CH01");
			chara.x = 350;
			chara.y = 350;
			this.addChild(chara);
		#else

			//for(i in 0...30)
			//{
				//var chara = Assets.getMovieClip ("Graph:CH01");
				//chara.x = 200;
				//chara.y = 200;
				//this.addChild(chara);
			//}
		#end

		
		var control:C_Xbox = new C_Xbox(0.05, this);
		M_Marionette.bindXbox(control);
		

		var g:BitmapData = new BitmapData(50,50,false,0x0000FF);
		var bmp:Bitmap = new Bitmap(g);
		bmp.x = -25;
		bmp.y = -25;

		Box = new Sprite();
		Box.x = 100;
		Box.y = 100;

		Box.addChild(bmp);
		this.addChild(Box);

		var textfps = new FPS(10,10,0xFFFFFF);
		addChild(textfps);

		addEventListener(Event.ENTER_FRAME, gameUpdate);
		removeEventListener(Event.ADDED_TO_STAGE, init);
	}

	function gameUpdate(e:Event)
	{
		
		Box.x += M_Marionette.jx.analogLX*speed;
		Box.y += M_Marionette.jx.analogLY*speed;

		var rot = Math.atan2(M_Marionette.jx.analogRY, M_Marionette.jx.analogRX);
		Box.rotation = (rot*180/Math.PI)-90;

		if(M_Marionette.jx.buttons[M_Marionette.jx.XBOX_A] == true)
		{
			trace("OK!");
		}
	}
}