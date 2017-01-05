package com.spiral.maryrose.charactercase.events
{

import flash.events.Event;

	
	public class ObjectMenuEvent extends Event
	{
	     //the event type ON_ADD_CONTACT is used when a contact is added to our list
	     public static const ON_HILIGHT_OBJECT:String = "onHilight";
		 public static const ON_END_SEQUENCE:String = "onEndSequence";
		public static const CLICK:String = "onClicked";
		
	     public var objectIndex:uint =0;
		
	     public function ObjectMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void
	     {
	          //we call the super class Event
	          super(type, bubbles, cancelable);
	     }
	}



}

