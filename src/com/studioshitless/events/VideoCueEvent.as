package com.studioshitless.events
{

import flash.events.Event;

	public class VideoCueEvent extends Event
	{
	     //the event type ON_ADD_CONTACT is used when a contact is added to our list
	     public static const ON_NAVCUEPOINT:String = "onNavCuePoint";
		 public static const ON_EVTCUEPOINT:String = "onEvtCuePoint";

	     public var cueIndex:uint =0;

	     public function VideoCueEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void
	     {
	          //we call the super class Event
	          super(type, bubbles, cancelable);
	     }
	}

}

