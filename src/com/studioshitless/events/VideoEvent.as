package com.studioshitless.events
{

import flash.events.Event;

public class VideoEvent extends Event
{
	
	public static const VIDEO_STOP:String = "onStop";
	public static const RESUME_VIDEO:String = "onResume";

	public function VideoEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event
	{
		return new VideoEvent(type, bubbles, cancelable);
	}
	
}

}

