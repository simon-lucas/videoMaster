﻿package StateMachine{import flash.utils.Timer;import flash.events.TimerEvent;import VideoApp;import flash.events.MouseEvent;import flash.events.Event;import data.Global;	public class AttractorState extends GenericState implements IState	{		public var timer:Timer		public function AttractorState(actor:*)		{			super(actor);						timer = new Timer(1000, 30 /*Global.configData.timeoutsecs*/)			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timeOut)			timer.addEventListener(TimerEvent.TIMER, dotick)			//actor.stage.removeEventListener(MouseEvent.CLICK, resetTimer)			//actor.stage.addEventListener(MouseEvent.CLICK, resetTimer)			actor.stage.addEventListener(MouseEvent.MOUSE_DOWN, resetTimer)		}				public function enter():void		{			debug=true;			trace(VideoApp.ATTRACTOR, "enter")			actor.showStage(VideoApp.ATTRACTOR)			actor.attractorSprite.warning.visible=false			actor.attractorSprite.addEventListener(MouseEvent.MOUSE_DOWN, actor.goLangState)			actor.attractorSprite.startAttractor()			actor.removeEventListener("videoTick", resetTimer)			trace("timer stop")			timer.stop()			if (debug) trace("start ", VideoApp.ATTRACTOR, "state")		}				public function dotick(e:TimerEvent):void{			//trace("tick")			//trace("tick", timer.currentCount, timer.repeatCount)			if (Global.videoPlaying) resetTimer()			if (timer.currentCount == timer.repeatCount - 10){				actor.attractorSprite.visible=true				actor.attractorSprite.warning.visible=true				actor.attractorSprite.warning.addEventListener(MouseEvent.MOUSE_DOWN, warningClick)			}			if (timer.currentCount >= timer.repeatCount - 10){				actor.attractorSprite.warning.countdown.text = String(timer.repeatCount - timer.currentCount)			}		}				public function warningClick(e:MouseEvent):void{			actor.attractorSprite.visible=false			actor.attractorSprite.warning.visible=false			resetTimer()		}				public function update(tickCount:uint):void		{		}				public function exit():void		{			if (debug) trace("exit ", VideoApp.ATTRACTOR, "state")			trace("exit attarctor start timer")			//actor.stage.addEventListener(MouseEvent.CLICK, resetTimer)			actor.addEventListener("videoTick", resetTimer)			actor.attractorSprite.stopAttractor()			actor.hideStage(VideoApp.ATTRACTOR)			actor.attractorSprite.removeEventListener(MouseEvent.MOUSE_DOWN, actor.goLangState)			//trace("timer", timer.running)			timer.reset()			timer.start()			//trace("timer", timer.running)		}				public function timeOut(e:TimerEvent):void{			actor.goAttractorState()					}				public function resetTimer(e:Event = null):void{			//trace("resetTimer")			timer.reset()			timer.start()		}	}}