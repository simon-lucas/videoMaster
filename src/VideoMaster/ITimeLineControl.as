package VideoMaster {
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	
	
	public interface ITimeLineControl {
		
		function init(mapSprite:GulfMapAnimation):void;	
		function initTL():void;	
		function setLoc(x, y):void;	
		function startStopTL(e:MouseEvent):void;		
		function playStop(state:Boolean):void;		
		function onDrag(e:MouseEvent):void;
		function endDrag(e:MouseEvent):void;		
		function doDragTL(e:Event):void;
		function playAnim(e:TimerEvent):void;
		function deInit():void;
	}
	
}