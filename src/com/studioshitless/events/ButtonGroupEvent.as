package com.studioshitless.events
{

import flash.events.Event;

public class ButtonGroupEvent extends Event
{
	
	public static const BUTTONCLICKED:String = "onButtonClick";
	public var buttonID:uint;
	public function ButtonGroupEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event
	{
		return new ButtonGroupEvent(type, bubbles, cancelable);
	}
	
}

}

