package com.mint;


import flash.events.Event;
import flash.display.Sprite;
import openfl.events.JoystickEvent;

class C_Xbox extends Sprite
{
	private var threshold:Float;

	public var analogLX:Float = 0.0;
	public var analogLY:Float = 0.0;
	public var analogRX:Float = 0.0;
	public var analogRY:Float = 0.0;
	public var hatX:Float = 0.0;
	public var hatY:Float = 0.0;
	public var buttons:Array<Bool>;

	//For XBOX Controllers
	public var XBOX_analogRX:Float = 0.0;
	public var XBOX_analogRY:Float = 0.0;
	public var XBOX_LT:Float = 0.0;
	public var XBOX_RT:Float = 0.0;

	public var XBOX_A:Int = 0;
	public var XBOX_B:Int = 1;
	public var XBOX_X:Int = 2;
	public var XBOX_Y:Int = 3;
	public var XBOX_LB:Int = 4;
	public var XBOX_RB:Int = 5;
	public var XBOX_BACK:Int = 6;
	public var XBOX_START:Int = 7;
	public var XBOX_LA:Int = 8;
	public var XBOX_RA:Int = 9;


	public function new(axisThreshold:Float, prt:Sprite)
	{
		super();

		trace("Initializing USBController...");
		threshold = axisThreshold;
		prt.addChild(this);
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(e:Event)
	{
		buttons = new Array();
		for(i in 0...20)
		{
			buttons.push(false);
		}

		stage.addEventListener(JoystickEvent.AXIS_MOVE, onAxisMove);
		stage.addEventListener(JoystickEvent.HAT_MOVE, onHatMove);
		stage.addEventListener(JoystickEvent.BUTTON_DOWN, onButtonDown);
		stage.addEventListener(JoystickEvent.BUTTON_UP, onButtonUp);

		this.removeEventListener(Event.ADDED_TO_STAGE, init);
		trace("...Success!");
	}

	private function onAxisMove(e:JoystickEvent)
	{
		trace("axis:"+e.axis);

		if(e.axis[0] >= threshold || e.axis[0] <= -threshold)
		{
			analogLX = e.axis[0];
		}
		else
		{
			analogLX = 0;
		}

		if(e.axis[1] >= threshold || e.axis[1] <= -threshold)
		{
			analogLY = e.axis[1];
		}
		else
		{
			analogLY = 0;
		}

		if(e.axis[3] >= threshold || e.axis[3] <= -threshold)
		{
			analogRY = e.axis[3];
		}
		else
		{
			analogRY = 0;
		}

		if(e.axis[4] >= threshold || e.axis[4] <= -threshold)
		{
			analogRX = e.axis[4];
		}
		else
		{
			analogRX = 0;
		}



		XBOX_LT = e.axis[2];
		if(XBOX_LT < 0.001)
		{
			XBOX_LT = 0.0;
		}

		XBOX_RT = -(e.axis[2]);
		if(XBOX_RT < 0.001)
		{
			XBOX_RT = 0.0;
		}

		if(e.axis[4] >= threshold || e.axis[4] <= -threshold)
		{
			XBOX_analogRX = e.axis[4];
		}
		else
		{
			XBOX_analogRX = 0;
		}

		if(e.axis[3] >= threshold || e.axis[3] <= -threshold)
		{
			XBOX_analogRY = e.axis[3];
		}
		else
		{
			XBOX_analogRY = 0;
		}

	}

	private	function onHatMove(e:JoystickEvent)
	{
		hatX = e.x;
		hatY = e.y;
		trace(e.axis);
	}

	private function onButtonDown(e:JoystickEvent)
	{
		buttons[e.id] = true;
	}

	private function onButtonUp(e:JoystickEvent)
	{
		buttons[e.id] = false;
	}
}