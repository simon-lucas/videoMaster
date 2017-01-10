﻿package VideoMaster {		import flash.display.MovieClip;	import flash.events.TimerEvent;	import flash.events.Event;	import flash.utils.Timer;	import flash.events.MouseEvent;			public class TimeLineControlE extends TimeLineControlSpriteE  implements ITimeLineControl{				public var playTL:PlayTimeLine					private var inc = 1;		private var yearWidth:Number //pxile width of year		private var dragging:Boolean=false;		private var offsetX:Number		private var animTimer:Timer		private var dragTimer:Timer		private var frameCounter = 0		private var mapSprite:GulfMapAnimation;							public function TimeLineControlE() {			// constructor code					}				public function setLoc(x, y):void{			this.x= x			this.y= y		}				public function init(mapSprite:GulfMapAnimation):void{			this.mapSprite = mapSprite							playTL =  new PlayTimeLine()			playTL.y=200			playTL.gotoAndStop(1)			addChild(playTL)			playTL.addEventListener(MouseEvent.MOUSE_DOWN, startStopTL)			initTL()							indicate.addEventListener(MouseEvent.MOUSE_DOWN,onDrag)				indicate.addEventListener(MouseEvent.MOUSE_UP,endDrag)					stage.addEventListener(MouseEvent.MOUSE_UP,endDrag)							animTimer = new Timer(40,0)			animTimer.addEventListener(TimerEvent.TIMER,playAnim)			playStop(true)							dragTimer = new Timer(40,0)			dragTimer.addEventListener(TimerEvent.TIMER,doDragTL)		}				public function initTL():void{			var dates = [1800,1200,1000,800,0]			var tlwidth = 1800/4			yearWidth=tlwidth/1800			bg.width = tlwidth			for (var i:int = 1; i < 6; i++)							{				this["date"+i].x = (1800-dates[i-1]) * yearWidth				trace(this["date"+i].x)				this["m"+i].x= this["date"+i].x			}		}				public function startStopTL(e:MouseEvent):void{			if (animTimer.running){				animTimer.stop()				playTL.gotoAndStop(1)			}else{				inc=1				animTimer.start()				playTL.gotoAndStop(2)			}		}				public function playStop(state:Boolean):void{			if (state==false){				animTimer.stop()				playTL.gotoAndStop(1)			}else{				animTimer.start()				playTL.gotoAndStop(2)			}		}				public function onDrag(e:MouseEvent):void{			dragging=true			playStop(false)			dragTimer.start()			offsetX = mouseX - indicate.x		}		public function endDrag(e:MouseEvent):void{			dragging=false			dragTimer.stop()		}				public function doDragTL(e:Event):void{			if (mouseX > x && mouseX < bg.width){				indicate.x = mouseX  - offsetX			 	var tyear = indicate.x / yearWidth 				//trace(indicate.x , yearWidth, tyear)				var yFrame = tyear / ( 1800/mapSprite.totalFrames) 				//trace("year:", tyear, "frame: ", yFrame) 				mapSprite.gotoAndStop(Math.floor(yFrame) )				frameCounter = mapSprite.currentFrame			}						}		public function playAnim(e:TimerEvent):void{			if (!dragging){				frameCounter+=inc;				if (frameCounter<mapSprite.totalFrames && frameCounter>0){					mapSprite.gotoAndStop(frameCounter)				}else{					inc= inc * -1				}				indicate.x = yearWidth * ((1800/225) * mapSprite.currentFrame )			}else{				if (mouseX > x && mouseX < x + bg.width){					indicate.x = (mouseX - x) - offsetX				 	var tyear = indicate.x / yearWidth 					//trace(indicate.x , yearWidth, tyear)					var yFrame = tyear / ( 1800/mapSprite.totalFrames) 					//trace("year:", tyear, "frame: ", yFrame) 					mapSprite.gotoAndStop(Math.floor(yFrame) )					frameCounter = mapSprite.currentFrame				}			}					}				public function deInit():void{			playStop(false)			playTL.removeEventListener(MouseEvent.MOUSE_DOWN, startStopTL)			stage.removeEventListener(MouseEvent.MOUSE_UP,endDrag)			animTimer.stop()			animTimer.removeEventListener(TimerEvent.TIMER,playAnim)			dragTimer.stop()			dragTimer.removeEventListener(TimerEvent.TIMER,doDragTL)		}	}	}