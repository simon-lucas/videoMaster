package com.studioshitless.events
{

import flash.events.Event;

public class IButtonEvent extends Event
{
	
	public static const BUTTONCLICKED:String = "selectEvent";
	public var buttonID:uint;
	public function IButtonEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event
	{
		return new IButtonEvent(type, bubbles, cancelable);
	}
	
}

}

