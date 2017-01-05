package com.studioshitless.events
{

import flash.display.Sprite;
import flash.events.Event;

public class ImageLoaderEvent extends Event
{
	public static const LOADED:String = "onLoaded";
	
	 public function ImageLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void
     {
          //we call the super class Event
          super(type, bubbles, cancelable);
     }
	
}

}