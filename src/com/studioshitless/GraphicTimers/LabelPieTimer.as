package com.studioshitless.GraphicTimers
{

import flash.display.Sprite;
import com.studioshitless.GraphicTimers.PieTimer;

public class LabelPieTimer extends PieTimer
{
	public var label:PieLabel;
	
	public function LabelPieTimer(text:String)
	{
		super();
		label= new PieLabel();
		addChild(label)
		//label.x=this.width/2;
		trace(this.x,this.height)
		label.y= -112;
		label.textfield.text=text;
		trace(label.textfield.text,text)
	}
	
}

}