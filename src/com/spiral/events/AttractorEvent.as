package com.spiral.events
{

import flash.events.Event;

public class AttractorEvent extends Event
{
	
	public static const TIMEOUT:String = "timeOut";
	public static const ATTRACTOR_CLICKED:String = "attractorClicked";
	public static const TIMEOUT_WARNING:String = "timeOutWarning";
	
	public function AttractorEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event
	{
		return new AttractorEvent(type, bubbles, cancelable);
	}
	
}

}

