﻿package com.studioshitless.Utilities	 {      import flash.display.Sprite;        public class DrawLineRectangle extends Sprite      {          private var xPos:Number;          private var yPos:Number;          private var rWidth:Number;          private var rHeight:Number;          private var color:uint;            public function DrawLineRectangle(xPos:Number=0,yPos:Number=0,rWidth:Number=10,rHeight:Number=10,fillcolor:uint=0x336699, linecolour:uint=0x336699)          {  			super()			 graphics.lineStyle(1, linecolour);           	//this.graphics.beginFill(fillcolor);             graphics.drawRect(xPos,yPos,rWidth,rHeight);              //this.graphics.endFill();  		        }      }  }