package com.mint;

import com.mint.C_Keyboard;

#if !flash
import com.mint.C_Xbox;
#end

class M_Marionette
{	
	private static var instance:M_Marionette = new M_Marionette();

	public static var k:C_Keyboard;

	#if !flash
	public static var jx:C_Xbox;
	#end

	public static function getInstance()
	{
		return instance;
	}

	public static function bindKeyboard(keyboard:C_Keyboard)
	{
		if(keyboard != null)
		{
			k = keyboard;
		}
	}

	#if !flash
		public static function bindXbox(joystick:C_Xbox)
		{
			if(joystick != null)
			{
				jx = joystick;
			}
		}

		public static function bindJoystick()
		{
			
		}
	#end

	private function new()
	{
		
	}
}