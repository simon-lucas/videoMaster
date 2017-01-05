package com.spiral.events
{

import flash.events.Event;

public class VideoEventZ extends Event
{
	
	public static const VIDEO_STOP:String = "onStop";
	public static const RESUME_VIDEO:String = "onResume";
	public static const TICK:String = "onTick";
	
	public var v_length:uint;
	public var current_time:uint;
	
	public function VideoEventZ(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event
	{
		return new VideoEventZ(type, bubbles, cancelable);
	}
	
}

}

