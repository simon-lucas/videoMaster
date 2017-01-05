package com.spiral.maryrose.charactercase.events
{

import flash.events.Event;

public class MenuObjectEvent extends Event
{
	

	public static const OBJ_LOADED:String = "onObjLoaded";
	public static const CLICK:String = "onMouse";

	public var objectIndex:uint =0;
	
	public function MenuObjectEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event
	{
		return new MenuObjectEvent(type, bubbles, cancelable);
	}
	
}

}

