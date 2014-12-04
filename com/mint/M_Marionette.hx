package com.mint;

import com.mint.C_Xbox;
import com.mint.C_Keyboard;

class M_Marionette
{	
	private static var instance:M_Marionette = new M_Marionette();

	public static var jx:C_Xbox;
	public static var k:C_Keyboard;

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

	public static function bindXbox(joystick:C_Xbox)
	{
		if(joystick != null)
		{
			jx = joystick;
		}
	}

	private function new()
	{
		
	}
}