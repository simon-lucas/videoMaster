package com.studioshitless.views
{

import flash.display.Sprite;
import flash.events.MouseEvent;
import com.studioshitless.events.IButtonEvent;

public class StandardButton extends Sprite implements IButton
{
	public var buttonID:uint;
	
	public function StandardButton()
	{
		super();
		addEventListener(MouseEvent.MOUSE_DOWN,clicked)
	}
	
	public function clicked(e:MouseEvent):void{
		var evt:IButtonEvent = new IButtonEvent(IButtonEvent.BUTTONCLICKED)
		evt.buttonID = buttonID;
		dispatchEvent(evt);
	}
	
	public function setOff():void{
		trace("setOff", buttonID)
		alpha=1;
	}

	public function setOn():void{
		trace("setOn", buttonID)
		alpha=0.2;	
	}
		
}

}